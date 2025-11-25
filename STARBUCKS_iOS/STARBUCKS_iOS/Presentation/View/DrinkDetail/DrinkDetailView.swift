//
//  DrinkDetailView.swift
//  STARBUCKS_iOS
//
//  Created by 진소은 on 11/17/25.
//

import UIKit

import SnapKit
import Then

final class DrinkDetailView: BaseView {
    
    // MARK: - Properties
    
    private var defaultPrice = Int()
    var onDeleteOption: ((Int) -> Void)?
    var onSizeChanged: ((String) -> Void)?
    private var sizePrices: SizePriceEntity?
    
    // MARK: - UI Components
    
    var drinkInfoHeaderView = DrinkInfoHeaderView()
    var drinkNutritionInfoVRow = DrinkNutritionInfoRow()
    var cupSelectionView = CupSelectionView()
    var campaignView = CampaignView()
    var personalView = PersonalOptionView()
    
    // MARK: - Life Cycle
    
    // MARK: - Set UI
    
    override func setUI() {
        self.backgroundColor = .white
        self.addSubviews(drinkInfoHeaderView, drinkNutritionInfoVRow, cupSelectionView, campaignView, personalView)
        cupSelectionView.delegate = self
        personalView.onTapOptionDelete = { [weak self] index in
            self?.onDeleteOption?(index)
        }
    }
    
    // MARK: - Set Layout
    
    override func setLayout() {
        drinkInfoHeaderView.snp.makeConstraints  {
            $0.top.horizontalEdges.equalToSuperview()
        }
        
        drinkNutritionInfoVRow.snp.makeConstraints {
            $0.top.equalTo(drinkInfoHeaderView.snp.bottom).offset(19)
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
    
    private func applySize(_ size: CupSelectionView.CupSize) {
        
        let cupPrice = defaultPrice + getSizePrice(size: size)
        drinkInfoHeaderView.setPrice(cupPrice)
        
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
        drinkInfoHeaderView.setInfo(
            name: entity.menuKr,
            engName: entity.menuEng,
            detail: entity.info
        )
        personalView.configure(options: entity.personalOptions)
        
        // TODO: - Use Kingfisher
        //        if let url = URL(string: entity.imageUrl) {
        //             drinkInfoHeaderView.imageView.kf.setImage(with: url)
        //        }
        
        self.defaultPrice = entity.basePrice
        self.sizePrices = entity.sizePrices
        
        let initialSize: CupSelectionView.CupSize = {
            switch entity.size {
            case .tall:   return .tall
            case .grande: return .grande
            case .venti:  return .venti
            }
        }()
        
        applySize(initialSize)
        cupSelectionView.setInitialSize(initialSize)
    }
}

// MARK: - Delegate

extension DrinkDetailView: CupSelectionViewDelegate {
    func cupSelectionView(_ view: CupSelectionView, didSelect size: CupSelectionView.CupSize) {
        applySize(size)
    }
    
    private func getSizePrice(size: CupSelectionView.CupSize) -> Int {
        guard let sizePrices else { return 0 }
        switch size {
        case .tall:   return sizePrices.tall
        case .grande: return sizePrices.grande
        case .venti:  return sizePrices.venti
        }
    }
}
