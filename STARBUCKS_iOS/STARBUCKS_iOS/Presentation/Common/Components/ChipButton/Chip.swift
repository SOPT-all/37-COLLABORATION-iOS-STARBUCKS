//
//  Chip.swift
//  STARBUCKS_iOS
//
//  Created by 안치욱 on 11/19/25.
//

import UIKit

import SnapKit
import Then

final class Chip: UIView {
    
    // MARK: - Properties
    
    private let chipType: ChipType
    
    // MARK: - UI Components
    
    private let chipIcon = UIImageView()
    private let chipNameLabel = UILabel()
    private let chipView = UIView()
    private let newView = UIView()
    private let newLabel = UILabel()
    private let numberLabel = UILabel()
    
    // MARK: - init
    
    init(type: ChipType) {
        self.chipType = type
        super.init(frame: .zero)
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting Method
    
    private func setUI() {
        self.backgroundColor = .clear
        
        chipIcon.do {
            $0.image = chipType.image
        }
        
        chipNameLabel.do {
            $0.text = chipType.title
            $0.font = .pretendard(.caption_r_14)
            $0.textColor = .starbucksGray600
        }
        
        chipView.do {
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 20.5
            $0.layer.borderColor = UIColor.starbucksGreen70010.cgColor
            $0.layer.borderWidth = chipType.selected ? 1.0 : 0.0
        }
        
        newView.do {
            $0.backgroundColor = .starbucksGreen500
            $0.layer.cornerRadius = 2
            $0.isHidden = (chipType != .green)
        }
        
        newLabel.do {
            $0.text = "NEW"
            $0.textColor = .white
            $0.font = .pretendard(.caption_r_10)
        }
        
        numberLabel.do {
            $0.text = "2"
            $0.textColor = .starbucksGreen500
            $0.isHidden = (chipType != .green)
        }
    }
    
    private func setHierarchy() {
        self.addSubviews(
            chipView,
            newView
        )
        
        newView.addSubview(newLabel)
        
        chipView.addSubviews(
            chipIcon,
            chipNameLabel,
            numberLabel
        )
    }
    
    private func setLayout() {
        chipView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(41)
            $0.width.equalTo(chipType.width)
        }
        
        chipIcon.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(chipType.leadingInset)
        }
        
        chipNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(chipIcon.snp.trailing).offset(chipType.secondInset)
        }
        
        numberLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(14)
        }
        
        newView.snp.makeConstraints {
            $0.centerY.equalTo(chipView.snp.top)
            $0.leading.equalToSuperview().inset(9)
            $0.width.equalTo(30)
            $0.height.equalTo(15)
        }
        
        newLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}
