//
//  DrinkDetailViewController.swift
//  STARBUCKS_iOS
//
//  Created by 진소은 on 11/17/25.
//

import UIKit

import Moya
import SnapKit
import Then

protocol SaveMenuDelegate: AnyObject {
    func updateView()
}

final class DrinkDetailViewController: BaseViewController {
    
    // MARK: - Properties
    
    weak var delegate: SaveMenuDelegate?
    private var drinkDetailEntity: DrinkDetailEntity?
    private let service = DrinkDetailService()
    private var personalOptions: [PersonalOptionEntity] = []
    private var price: Int = 0
    private var optionPrice: Int = 0
    private let saveService = SaveMenuService()
    private var isHot: Bool = true
    private var size: String = ""
    
    // MARK: - UI Components
    
    private let shareBar = NavigationBar(type: .share)
    private var scrollView = UIScrollView()
    private let drinkDetailView = DrinkDetailView()
    private var saveOptionView = SaveOptionView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        fetchDrinkDetail()
        resetOption()
        deleteOption()
        bindCallbacks()
        patchMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    // MARK: - Set UI
    
    override func setUI() {
        view.addSubviews(
            shareBar,
            scrollView,
            saveOptionView
        )
        scrollView.addSubviews(drinkDetailView)
        
        view.bringSubviewToFront(shareBar)
        scrollView.contentInsetAdjustmentBehavior = .never

        saveOptionView.do {
            $0.layer.shadowOffset = CGSize(width: 0, height: 2)
            $0.layer.shadowOpacity = 0.25
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.position = .init(x: 0, y: -3)
        }
    }
    
    // MARK: - Set Layout
    
    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(saveOptionView.snp.top)
        }
        
        shareBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(40)
        }

        drinkDetailView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.bottom.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        saveOptionView.snp.makeConstraints {
            $0.bottom.horizontalEdges.equalToSuperview()
            $0.height.equalTo(123)
        }
    }
    
    // MARK: - Private Methods
    
    private func fetchDrinkDetail() {
        service.fetchDrinkDetail(for: 1) { [weak self] result in
            switch result {
            case .success(let dto):
                let entity = dto.toEntity()
                self?.drinkDetailEntity = entity
                self?.personalOptions = entity.personalOptions
                self?.optionPrice = entity.personalOptions.reduce(0) { $0 + $1.price }
                self?.drinkDetailView.configure(with: entity)
                self?.setInitialSaveOption(with: entity)
                self?.isHot = entity.isHot
            case .requestErr(let message):
                print("요청 에러:", message)
            case .pathErr:
                print("경로(path) 에러")
            case .serverErr:
                print("서버 에러")
            case .networkFail:
                print("네트워크 실패")
            }
        }
    }
    
    private func setInitialSaveOption(with entity: DrinkDetailEntity) {
        saveOptionView.setTemperature(isHot: entity.isHot)
        
        let sizeText: String
        switch entity.size {
        case .tall:   sizeText = "Tall"
        case .grande: sizeText = "Grande"
        case .venti:  sizeText = "Venti"
        }
        saveOptionView.setSize(sizeText)
    }

    private func bindCallbacks() {
        drinkDetailView.onTemperatureChanged = { [weak self] isHot in
            self?.saveOptionView.setTemperature(isHot: isHot)
            self?.isHot = isHot
        }
        drinkDetailView.onSizeChanged = { [weak self] size in
            self?.saveOptionView.setSize(size)
            self?.size = size
        }
        shareBar.leftButtonHandler = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    private func resetOption() {
        drinkDetailView.personalView.onTapReset = { [weak self] in
            let alert = Alert(type: .reset)
            let backView = UIView()
            backView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
            self?.view.addSubviews(alert, backView)
            self?.view.bringSubviewToFront(alert)
            backView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
            alert.snp.makeConstraints {
                $0.center.equalToSuperview()
            }
            
            alert.cancelButtonTap = {
                backView.removeFromSuperview()
            }
            alert.confirmButtonTap = {
                backView.removeFromSuperview()
                self?.personalOptions.removeAll()
                self?.optionPrice = 0
                self?.drinkDetailView.personalView.resetOptions()
                self?.setPrice()
            }
        }
    }
    
    private func deleteOption() {
        drinkDetailView.onDeleteOption = { [weak self] index in
            let optionName = self?.personalOptions[index].name
            let alert = Alert(type: .delete, subtitle: optionName ?? "")
            let backView = UIView()
            backView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
            self?.view.addSubviews(alert, backView)
            self?.view.bringSubviewToFront(alert)
            backView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
            
            alert.snp.makeConstraints {
                $0.center.equalToSuperview()
            }

            alert.cancelButtonTap = {
                backView.removeFromSuperview()
            }
            alert.confirmButtonTap = {
                guard let self = self else { return }
                backView.removeFromSuperview()

                let deletingPrice = self.personalOptions[index].price
                self.optionPrice -= deletingPrice
                self.personalOptions.remove(at: index)
                self.drinkDetailView.personalView.deleteOption(at: index)
                self.setPrice()
            }
        }
    }
    
    private func setPrice() {
        price = (drinkDetailEntity?.basePrice ?? 0) + optionPrice + self.drinkDetailView.sizePrice
        self.drinkDetailView.setPrice(price: price)
    }
    
    private func saveMenu() -> SaveMenuDataDTO {
        let upperSize: String
        switch size {
        case "Tall": upperSize = "TALL"
        case "Grande": upperSize = "GRANDE"
        case "Venti": upperSize = "VENTI"
        default:
            upperSize = size
        }
        return SaveMenuDataDTO(
            isHot: self.isHot,
            size: upperSize,
            personalOptions: self.personalOptions.map { $0.toDTO() }
        )
    }
    
    private func patchMenu() {
        saveOptionView.saveButtonHandler = { [weak self] in
            guard let self = self else { return }
            let body = self.saveMenu()
            saveService.saveMenu(drinkId: 1, body: body) { result in
                switch result {
                case .success(let dto):
                    print(dto)
                    self.delegate?.updateView()
                    self.navigationController?.popViewController(animated: true)
                case .requestErr(let message):
                    print("요청 에러:", message)
                case .pathErr:
                    print("경로(path) 에러")
                case .serverErr:
                    print("서버 에러")
                case .networkFail:
                    print("네트워크 실패")
                }
            }
        }
    }
}
