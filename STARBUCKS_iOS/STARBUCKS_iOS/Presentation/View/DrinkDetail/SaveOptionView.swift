//
//  SaveOptionView.swift
//  STARBUCKS_iOS
//
//  Created by 진소은 on 11/24/25.
//

import UIKit

import SnapKit
import Then

final class SaveOptionView: BaseView {
    
    // MARK: - UI Components
    
    var hotOptionLabel = UILabel()
    private let separatorLabel = UILabel()
    var sizeOptionLabel = UILabel()
    private var buttonStackView = UIStackView()
    private var addButton = UIButton()
    private var saveButton = UIButton()
    
    // MARK: - Set UI
    
    override func setUI() {
        hotOptionLabel.do {
            $0.text = "ICED"
            $0.font = .pretendard(.body_r_13)
            $0.textColor = .starbucksGray700
        }
        
        separatorLabel.do {
            $0.text = " | "
            $0.font = .pretendard(.body_r_13)
            $0.textColor = .starbucksGray700
        }
        
        sizeOptionLabel.do {
            $0.text = "Tall"
            $0.font = .pretendard(.body_r_13)
            $0.textColor = .starbucksGray700
        }
        
        buttonStackView.do {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.spacing = 8
            $0.alignment = .center
        }
        
        addButton.do {
            $0.setTitle("새로 추가하기", for: .normal)
            $0.setTitleColor(.starbucksGreen500, for: .normal)
            $0.layer.cornerRadius = 20.5
            $0.layer.borderColor = UIColor(.starbucksGreen500).cgColor
            $0.layer.borderWidth = 2
            $0.layer.masksToBounds = true
            $0.backgroundColor = .white
            $0.titleLabel?.font = .pretendard(.caption_r_14)
        }
        
        saveButton.do {
            $0.setTitle("저장하기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.layer.cornerRadius = 20.5
            $0.layer.masksToBounds = true
            $0.backgroundColor = .starbucksGreen500
            $0.titleLabel?.font = .pretendard(.caption_r_14)
        }
    }
    
    // MARK: - Set Layout
    
    override func setLayout() {
        addSubviews(hotOptionLabel, separatorLabel, sizeOptionLabel, buttonStackView)
        buttonStackView.addArrangedSubviews(addButton, saveButton)
        
        hotOptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.leading.equalToSuperview().inset(23)
        }
        
        separatorLabel.snp.makeConstraints {
            $0.centerY.equalTo(hotOptionLabel)
            $0.leading.equalTo(hotOptionLabel.snp.trailing)
        }
        
        sizeOptionLabel.snp.makeConstraints {
            $0.centerY.equalTo(hotOptionLabel)
            $0.leading.equalTo(separatorLabel.snp.trailing)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(hotOptionLabel.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(32)
        }
        
        addButton.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.width.equalTo(147)
        }
        
        saveButton.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.width.equalTo(147)
        }
    }
    
    // MARK: - Public Methods
    
    public func setTemperature(isHot: Bool) {
        sizeOptionLabel.text = isHot ? "HOT" : "ICED"
    }
    
    public func setSize(_ size: String) {
        sizeOptionLabel.text = size
    }
}
