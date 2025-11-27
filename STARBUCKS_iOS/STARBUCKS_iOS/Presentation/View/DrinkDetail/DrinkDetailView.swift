//
//  DrinkDetailView.swift
//  STARBUCKS_iOS
//
//  Created by 진소은 on 11/17/25.
//

import UIKit

import Kingfisher
import SnapKit
import Then

final class DrinkDetailView: BaseView {
    
    // MARK: - Properties
    
    var onDeleteOption: ((Int) -> Void)?
    var onSizeChanged: ((String) -> Void)?
    var onTemperatureChanged: ((Bool) -> Void)?
    var sizePrice: Int = 0
    private var sizePrices: SizePriceEntity?
    private var size = DrinkSize(rawValue: "TALL")
    private var defaultPrice: Int = 0
    private var price: Int = 0
    
    private var hotMenuKr: String = ""
    private var hotMenuEng: String = ""
    private var hotImageUrl: String = ""
    private var iceMenuKr: String = ""
    private var iceMenuEng: String = ""
    private var iceImageUrl: String = ""
    
    // MARK: - UI Components
    
    var drinkInfoHeaderView = DrinkInfoHeaderView()
    var segmentView = Segment()
    var drinkNutritionInfoVRow = DrinkNutritionInfoRow()
    var cupSelectionView = CupSelectionView()
    var campaignView = CampaignView()
    var personalView = PersonalOptionView()

    // MARK: - Set UI
    
    override func setUI() {
        self.backgroundColor = .white
        self.addSubviews(
            drinkInfoHeaderView,
            segmentView,
            drinkNutritionInfoVRow,
            cupSelectionView,
            campaignView,
            personalView
        )
        cupSelectionView.delegate = self
        personalView.onTapOptionDelete = { [weak self] index in
            self?.onDeleteOption?(index)
        }
        segmentView.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
    }
    
    // MARK: - Set Layout
    
    override func setLayout() {
        drinkInfoHeaderView.snp.makeConstraints  {
            $0.top.horizontalEdges.equalToSuperview()
        }
        
        segmentView.snp.makeConstraints {
            $0.top.equalTo(drinkInfoHeaderView.snp.bottom).offset(18)
            $0.centerX.equalToSuperview()
        }
        
        drinkNutritionInfoVRow.snp.makeConstraints {
            $0.top.equalTo(segmentView.snp.bottom).offset(18)
            $0.horizontalEdges.equalToSuperview()
        }
        
        cupSelectionView.snp.makeConstraints {
            $0.top.equalTo(drinkNutritionInfoVRow.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
        }
        
        campaignView.snp.makeConstraints {
            $0.top.equalTo(cupSelectionView.snp.bottom).offset(22)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        personalView.snp.makeConstraints {
            $0.top.equalTo(campaignView.snp.bottom).offset(9)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(25)
        }
    }
    
    // MARK: - Private Methods
    
    private func applySize(_ size: DrinkSize) {
        price = defaultPrice + getSizePrice(size: size) + personalView.totalPrice
        drinkInfoHeaderView.setPrice(price)
        
        let sizeText: String = {
            switch size {
            case .tall:   return "Tall"
            case .grande: return "Grande"
            case .venti:  return "Venti"
            }
        }()
        onSizeChanged?(sizeText)
    }
    
    // MARK: - Public Methods
    
    func configure(with entity: DrinkDetailEntity) {
        hotMenuKr = entity.hotMenuKr
        hotMenuEng = entity.hotMenuEng
        hotImageUrl = entity.hotMenuImageUrl
        
        iceMenuKr = entity.iceMenuKr
        iceMenuEng = entity.iceMenuEng
        iceImageUrl = entity.iceMenuImageUrl
        
        updateMenuInfo(isHot: entity.isHot)
        drinkInfoHeaderView.setInfo(detail: entity.info)
        personalView.configure(options: entity.personalOptions)
        segmentView.setSelected(isHot: entity.isHot)
        
        self.defaultPrice = entity.basePrice
        self.sizePrices = entity.sizePrices
        
        let initialSize: DrinkSize = {
            switch entity.size {
            case .tall:   return .tall
            case .grande: return .grande
            case .venti:  return .venti
            }
        }()
        
        applySize(initialSize)
        cupSelectionView.setInitialSize(initialSize)
    }
    
    func setPrice(price: Int) {
        self.price = price
        self.drinkInfoHeaderView.setPrice(price)
    }
    
    @objc
    private func segmentChanged(_ sender: Segment) {
        let isHot = sender.isHotSelected
        updateMenuInfo(isHot: isHot)
        onTemperatureChanged?(isHot)
    }
    
    private func updateMenuInfo(isHot: Bool) {
        let menuKr = isHot ? hotMenuKr : iceMenuKr
        let menuEng = isHot ? hotMenuEng : iceMenuEng
        let imgUrl = isHot ? hotImageUrl : iceImageUrl
        
        drinkInfoHeaderView.setDrinkName(name: menuKr, engName: menuEng)

        if let url = URL(string: imgUrl) {
            drinkInfoHeaderView.setImage(url: url)
        }
    }
}

// MARK: - Delegate

extension DrinkDetailView: CupSelectionViewDelegate {
    func cupSelectionView(_ view: CupSelectionView, didSelect size: DrinkSize) {
        self.size = size
        applySize(size)
    }
    
    private func getSizePrice(size: DrinkSize) -> Int {
        guard let sizePrices else { return 0 }
        switch size {
        case .tall:
            self.sizePrice = sizePrices.tall
            return sizePrices.tall
        case .grande:
            self.sizePrice = sizePrices.grande
            return sizePrices.grande
        case .venti:
            self.sizePrice = sizePrices.venti
            return sizePrices.venti
        }
    }
}

