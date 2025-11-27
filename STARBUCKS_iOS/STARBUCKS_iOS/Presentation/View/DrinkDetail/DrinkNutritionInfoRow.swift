//
//  DrinkNutritionInfoRow.swift
//  STARBUCKS_iOS
//
//  Created by 진소은 on 11/20/25.
//

import UIKit

import SnapKit
import Then

final class DrinkNutritionInfoRow: BaseView {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let detailButton = UIButton()
    
    // MARK: - Set UI
    
    override func setUI() {
        titleLabel.do {
            $0.text = "제품영양정보"
            $0.font = .pretendard(.body_b_16)
            $0.textColor = .black
        }
        
        detailButton.do {
            $0.setImage(.iconArrowRight, for: .normal)
        }
    }
    
    // MARK: - Set Layout
    
    override func setLayout() {
        self.addSubviews(
            titleLabel,
            detailButton
        )
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.verticalEdges.equalToSuperview().inset(10)
        }
        
        detailButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(24)
        }
    }
}
