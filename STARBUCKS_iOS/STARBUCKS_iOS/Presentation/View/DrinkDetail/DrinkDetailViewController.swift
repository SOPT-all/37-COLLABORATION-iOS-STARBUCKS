//
//  DrinkDetailViewController.swift
//  STARBUCKS_iOS
//
//  Created by 진소은 on 11/17/25.
//

import UIKit

import SnapKit
import Then

final class DrinkDetailViewController: BaseViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let shareBar = NavigationBar(type: .share)
    var scrollView = UIScrollView()
    let drinkDetailView = DrinkDetailView()
    var saveOptionView = SaveOptionView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setSaveOptionLabel()
        resetOption()
        deleteOption()
        let dummyDrinkDetailEntity = DrinkDetailEntity(
            myMenuId: 1,
            menuKr: "아이스 핑크 팝 캐모마일 릴렉서",
            menuEng: "Iced Pink Pop Chamomile Relaxer",
            info: "크리스마스에 어울리는 샴페인 한잔과 같은 캐모마일 릴렉서! 리치, 레몬그라스, 캐모마일의 차분하면서도 새콤달콤한 조합 크리스마스 오너먼트가 떠오르는 핑크 리치 보바로 팝! 터지는 식감의 재미와 리치 풍미를 더했습니다",
            basePrice: 6500,
            isHot: false,
            size: .grande,
            sizePrices: SizePriceEntity(tall: 0, grande: 800, venti: 1600),
            personalOptions: [
                PersonalOptionEntity(name: "핑크 리치 보바 없음", price: 800),
                PersonalOptionEntity(name: "로즈마리 많이", price: 800),
                PersonalOptionEntity(name: "일반 휘핑 많이", price: 800)
            ],
            imageUrl: "https://image.starbucks.co.kr/upload/store/skuimg/2024/11/[9200000005660]_20241126100556486.jpg"
        )
        drinkDetailView.configure(with: dummyDrinkDetailEntity)
        setInitialSaveOption(with: dummyDrinkDetailEntity)
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
        view.addSubviews(shareBar, scrollView, saveOptionView)
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

    
    private func setSaveOptionLabel() {
//        drinkDetailView.onTemperatureChanged = { [weak self] isHot in
//            self?.saveOptionView.setTemperature(isHot)
//        }
        
        drinkDetailView.onSizeChanged = { [weak self] sizeText in
            self?.saveOptionView.setSize(sizeText)
        }
    }
    
    private func resetOption() {
        drinkDetailView.personalView.onTapReset = { [weak self] in
            let alret = Alert(type: .reset)
            let backView = UIView()
            backView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
            self?.view.addSubviews(alret, backView)
            self?.view.bringSubviewToFront(alret)
            backView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
            alret.snp.makeConstraints {
                $0.center.equalToSuperview()
            }
            
            alret.cancelButtonTap = {
                backView.removeFromSuperview()
            }
            alret.confirmButtonTap = {
                backView.removeFromSuperview()
                // TODO: - Remove item from list
            }
        }
    }
    
    private func deleteOption() {
        drinkDetailView.onDeleteOption = { [weak self] index in
            let alret = Alert(type: .delete, subtitle: "핑크 리치 보바 없음")
            let backView = UIView()
            backView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
            self?.view.addSubviews(alret, backView)
            self?.view.bringSubviewToFront(alret)
            backView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
            
            alret.snp.makeConstraints {
                $0.center.equalToSuperview()
            }
            
            alret.cancelButtonTap = {
                backView.removeFromSuperview()
            }
            alret.confirmButtonTap = {
                backView.removeFromSuperview()
                // TODO: - Remove item from list
            }
        }
    }
    
    // MARK: - Public Methods
    
    // MARK: - Set Actions
}
