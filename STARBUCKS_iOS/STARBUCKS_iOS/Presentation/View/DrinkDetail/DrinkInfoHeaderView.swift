//
//  DrinkInfoHeaderView.swift
//  STARBUCKS_iOS
//
//  Created by 진소은 on 11/20/25.
//

import UIKit

import SnapKit
import Then

final class DrinkInfoHeaderView: BaseView {
    
    // MARK: - UI Components
    
    private let nameStackView = UIStackView()
    private var drinkNameLabel = UILabel()
    private let newLabel = UILabel()
    private let drinkEngNameLabel = UILabel()
    private let drinkDetailLabel = UILabel()
    
    // MARK: - Set UI
    
    override func setUI() {
        self.addSubviews(nameStackView, drinkEngNameLabel, drinkDetailLabel)
        nameStackView.addArrangedSubviews(drinkNameLabel, newLabel)
        
        self.backgroundColor = .white
        
        nameStackView.do {
            $0.axis = .horizontal
            $0.distribution = .fill
            $0.alignment = .center
        }
        
        drinkNameLabel.do {
            $0.font = .pretendard(.head_b_21)
            $0.textColor = .black
        }
        
        newLabel.do {
            $0.text = "New"
            $0.font = .pretendard(.body_r_13)
            $0.textColor = .starbucksGreen500
        }
        
        drinkEngNameLabel.do {
            $0.font = .pretendard(.caption_r_13)
            $0.textColor = .starbucksGray600
        }
        
        drinkDetailLabel.do {
            $0.font = .pretendard(.caption_r_13)
            $0.textColor = .starbucksGray700
            $0.numberOfLines = 0
        }
    }
    
    // MARK: - Set Layout
    
    override func setLayout() {
        nameStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(34)
        }
        
        drinkEngNameLabel.snp.makeConstraints {
            $0.top.equalTo(nameStackView.snp.bottom)
            $0.horizontalEdges.equalTo(16)
        }
        
        drinkDetailLabel.snp.makeConstraints {
            $0.top.equalTo(drinkEngNameLabel.snp.bottom).offset(3.5)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(51)
        }
    }
    
    // MARK: - Public Methods
    
    public func setInfo(name: String, engName: String, detail: String) {
        drinkNameLabel.text = name
        drinkEngNameLabel.text = engName
        drinkDetailLabel.text = detail
    }
    
    public func setDrinkName(_ name: String) {
        drinkNameLabel.text = name
    }
    
}
