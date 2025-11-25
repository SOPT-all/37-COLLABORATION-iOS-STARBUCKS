//
//  CampaignView.swift
//  STARBUCKS_iOS
//
//  Created by 진소은 on 11/21/25.
//

import UIKit

import SnapKit
import Then

final class CampaignView: BaseView {
    
    // MARK: - Properties
    
    private var isChecked: Bool = false
    
    // MARK: - UI Components
    
    private let campaignLabel = UILabel()
    private var personalCupStackView = UIStackView()
    private var checkButton = UIButton()
    private let personalCupLabel = UILabel()
    private let ecoImage = UIImageView()
    
    // MARK: - Set UI
    
    override func setUI() {
        self.do {
            $0.backgroundColor = .starbucksGreen70010
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
        }
        
        campaignLabel.do {
            $0.text = "환경을 위해 친환경 캠페인에 동참해 보세요."
            $0.font = .pretendard(.body_sb_13)
            $0.textColor = .black
        }
        
        personalCupStackView.do {
            $0.axis = .horizontal
            $0.spacing = 8
            $0.alignment = .center
        }
        
        checkButton.do {
            $0.setImage(UIImage(resource: .iconCheckEmpty), for: .normal)
            $0.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        }
        
        personalCupLabel.do {
            $0.text = "개인컵 사용하기"
            $0.font = .pretendard(.caption_r_13)
            $0.textColor = .starbucksGray700
        }
        
        ecoImage.do {
            $0.image = UIImage(resource: .iconTree)
        }
    }
    
    // MARK: - Set Layout
    
    override func setLayout() {
        self.addSubviews(campaignLabel, personalCupStackView, ecoImage)
        personalCupStackView.addArrangedSubviews(checkButton, personalCupLabel)
        
        campaignLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(23)
            $0.leading.equalToSuperview().inset(19)
        }
        
        personalCupStackView.snp.makeConstraints {
            $0.top.equalTo(campaignLabel.snp.bottom).offset(27)
            $0.leading.equalToSuperview().inset(19)
            $0.bottom.equalToSuperview().inset(22)
        }
        
        ecoImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(14)
            $0.width.equalTo(42)
            $0.height.equalTo(46)
        }
    }
    
    // MARK: - Custom Methods
    
    @objc
    private func checkButtonTapped() {
        isChecked.toggle()
        let image = isChecked
        ? UIImage(resource: .iconCheckFill)
        : UIImage(resource: .iconCheckEmpty)
        
        checkButton.setImage(image, for: .normal)
    }
    
}
