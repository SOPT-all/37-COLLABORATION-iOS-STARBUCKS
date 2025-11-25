//
//  PersonalOption.swift
//  STARBUCKS_iOS
//
//  Created by 안치욱 on 11/20/25.
//

import UIKit

import SnapKit
import Then

final class PersonalOption: UIView {
    
    // MARK: - Properties
    
    var deleteButtonHandler: (() -> Void)?
    private let option: String
    private let price: String
    
    // MARK: - UI Components
    
    private let deleteButton = UIButton()
    private let optionLabel = UILabel()
    private let priceLabel = UILabel()
    
    // MARK: - init
    
    init(option: String, price: Int) {
        self.option = option
        self.price = price > 0 ? "\(price)원" : ""
        super.init(frame: .zero)
        
        setUI()
        setHierarchy()
        setLayout()
        setAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting Method
    
    private func setUI() {
        deleteButton.do {
            $0.setImage(.iconCancelSmall, for: .normal)
        }
        
        optionLabel.do {
            $0.text = option
            $0.textColor = .brown01
            $0.font = .pretendard(.caption_r_13)
        }
        
        priceLabel.do {
            $0.text = price
            $0.textColor = .brown01
            $0.font = .pretendard(.caption_r_13)
        }
    }
    
    private func setHierarchy() {
        self.addSubviews(
            deleteButton,
            optionLabel,
            priceLabel
        )
    }
    
    private func setLayout() {
        deleteButton.snp.makeConstraints {
            $0.centerY.leading.equalToSuperview()
        }
        
        optionLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(deleteButton.snp.trailing).offset(5)
        }
        
        priceLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
    
    private func setAction() {
        deleteButton.addTarget(self, action: #selector(deleteButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Method
    
    @objc
    private func deleteButtonDidTap() {
        deleteButtonHandler?()
    }
    
}
