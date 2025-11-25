//
//  FilteringBarView.swift
//  STARBUCKS_iOS
//
//  Created by 이서현 on 11/21/25.
//

import UIKit

import SnapKit
import Then

final class FilteringBarView: BaseView {
    
    // MARK: - Properties
    
    var didChangeCategory: ((MenuCategory) -> Void)?
    
    //MARK: - UI Components
    
    private let myMenuLabel = UILabel()
    private var buttons: [FilteringButton] = []
    private var selectedCategory: MenuCategory = .all
    
    private let stackView = UIStackView()
    
    // MARK: - Set UI
    
    override func setUI() {
        myMenuLabel.do {
            $0.text = "나만의 메뉴"
            $0.textColor = .black
            $0.font = UIFont.pretendard(.head_b_21)
        }
        stackView.do {
            $0.axis = .horizontal
            $0.alignment = .fill
            $0.distribution = .fillEqually
            $0.spacing = 10
        }
        
        MenuCategory.allCases.forEach {
            let button = FilteringButton(category: $0)
            button.addTarget(self, action: #selector(filterButtonTapped(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
            buttons.append(button)
        }
    }
    
    // MARK: - Set Layout
    
    override func setLayout() {
        addSubviews(myMenuLabel, stackView)
        
        myMenuLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        stackView.snp.makeConstraints {
            $0.top.equalTo(myMenuLabel.snp.bottom).offset(13)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Private Methods
    
    @objc
    private func filterButtonTapped(_ sender: FilteringButton) {
        // 어떤 버튼 눌렸는지
        let category = sender.category
        
        // 선택 상태 갱신
        selectedCategory = category
        
        UIView.animate(
            withDuration: 0.25,
            animations: {
                self.updateSelection(for: sender)
                self.layoutIfNeeded()
            },
            completion: nil
        )
        
        print("🆒")
        // 뷰컨/상위에서 필터링할 수 있게 콜백
        didChangeCategory?(category)
    }
    
    private func updateSelection(for selectedButton: FilteringButton) {
        buttons.forEach { button in
            button.isSelected = (button === selectedButton)
        }
    }
}
