//
//  PersonalOptionView.swift
//  STARBUCKS_iOS
//
//  Created by 진소은 on 11/21/25.
//

import UIKit

import SnapKit
import Then

final class PersonalOptionView: BaseView {
    
    // MARK: - Properties
    
    var onTapReset: (() -> Void)?
    var onTapOptionDelete: ((Int) -> Void)?
    var totalPrice: Int = 0
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let detailButton = UIButton()
    
    private let resetLabel = UILabel()
    private let resetButton = UIButton()
    
    private let tipView = UIView()
    private let tipLabel = UILabel()
        
    private var optionStackView = UIStackView()
    
    // MARK: - Set UI
    
    override func setUI() {
        setActions()
        titleLabel.do {
            $0.text = "퍼스널 옵션"
            $0.font = .pretendard(.body_b_16)
            $0.textColor = .black
        }
        
        detailButton.do {
            $0.setImage(.iconArrowRight, for: .normal)
        }
        
        resetLabel.do {
            $0.text = "전체 초기화"
            $0.font = .pretendard(.body_r_13)
            $0.textColor = .starbucksGreen500
        }
        
        resetButton.do {
            $0.setImage(.iconUndov, for: .normal)
        }
        
        tipView.do {
            $0.backgroundColor = .starbucksGray100
            $0.layer.cornerRadius = 5
            $0.layer.masksToBounds = true
        }
        
        tipLabel.do {
            $0.text = "TIP 스타벅스 카드로 결제하면 퍼스널 옵션 추가 금액을 할인받을 수 있어요."
            $0.font = .pretendard(.caption_r_11)
            $0.textColor = .starbucksGray600
            $0.numberOfLines = 0
        }
        
        optionStackView.do {
            $0.axis = .vertical
            $0.spacing = 9
        }
    }
    
    // MARK: - Set Layout
    
    override func setLayout() {
        self.addSubviews(titleLabel, detailButton, resetLabel, resetButton, tipView, optionStackView)
        tipView.addSubview(tipLabel)
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(10)
            $0.height.equalTo(39)
        }
        
        detailButton.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(10)
            $0.centerY.equalTo(titleLabel)
        }
        
        resetButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalTo(titleLabel)
        }
        
        resetLabel.snp.makeConstraints {
            $0.trailing.equalTo(resetButton.snp.leading).offset(-3)
            $0.centerY.equalTo(resetButton)
        }
        
        tipView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        tipLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(27)
            $0.verticalEdges.equalToSuperview().inset(13)
        }
        
        optionStackView.snp.makeConstraints {
            $0.top.equalTo(tipView.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Set Actions
    
    private func setActions() {
        resetButton.addTarget(self, action: #selector(resetButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc
    private func resetButtonDidTap() {
        onTapReset?()
    }
}

extension PersonalOptionView {
    func configure(options: [PersonalOptionEntity]) {
        optionStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        for (index, option) in options.enumerated() {
            let row = PersonalOption(option: option.name, price: option.price)
            totalPrice += option.price

            row.deleteButtonHandler = { [weak self] in
                guard let self = self else { return }
                if let currentIndex = self.optionStackView.arrangedSubviews.firstIndex(of: row) {
                    self.onTapOptionDelete?(currentIndex)
                }
            }


            optionStackView.addArrangedSubview(row)
        }
    }
    
    func resetOptions() {
        totalPrice = 0
        optionStackView.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
    }
    
    func deleteOption(at index: Int) {
        let views = optionStackView.arrangedSubviews
        guard index >= 0, index < views.count else { return }

        let target = views[index]
        optionStackView.removeArrangedSubview(target)
        target.removeFromSuperview()
    }
}
