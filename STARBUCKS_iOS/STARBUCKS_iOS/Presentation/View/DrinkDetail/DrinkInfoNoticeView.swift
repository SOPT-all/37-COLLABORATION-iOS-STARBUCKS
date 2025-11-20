//
//  DrinkInfoNoticeView.swift
//  STARBUCKS_iOS
//
//  Created by 진소은 on 11/20/25.
//

import UIKit

import SnapKit
import Then

final class DrinkInfoNoticeView: BaseView {
    
    // MARK: - UI Components
    
    private let stackView = UIStackView()
    
    private let warningLabel = UILabel()
    private let noticeLabel = UILabel()
    
    // MARK: - Set UI
    
    override func setUI() {
        self.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor(.starbucksGray200).cgColor
            $0.layer.masksToBounds = true
        }
        
        stackView.do {
            $0.axis = .vertical
            $0.spacing = 3
            $0.alignment = .leading
        }
        
        warningLabel.do {
            $0.text = "* 리치 과육의 속 껍질이 있을 수 있지만 안심하고 드세요."
            $0.font = .pretendard(.caption_r_11)
            $0.textColor = .starbucksGray600
            $0.textAlignment = .left
        }
        
        noticeLabel.do {
            $0.text = "* 대체당(효소처리 스테비아)을 일부 사용하여 당과\n 칼로리를 낮췄습니다."
            $0.font = .pretendard(.caption_r_11)
            $0.textColor = .starbucksGray600
            $0.numberOfLines = 0
            $0.textAlignment = .left
            $0.lineBreakMode = .byWordWrapping
        }
    }
    
    override func setLayout() {
        addSubviews(stackView)
        stackView.addArrangedSubviews(warningLabel, noticeLabel)
        
        stackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(9)
            $0.verticalEdges.equalToSuperview().inset(13)
        }
    }
}
