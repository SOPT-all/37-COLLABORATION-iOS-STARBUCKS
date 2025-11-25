//
//  MenuButton.swift
//  STARBUCKS_iOS
//
//  Created by 안치욱 on 11/21/25.
//

import UIKit

import SnapKit
import Then

final class MenuButton: UIView {
    
    // MARK: - Properties
    private var isMyMenuSelected: Bool = true {
        didSet { updateUI() }
    }
    private var editButtonConstraint: Constraint?
    var editButtonTap: (() -> Void)?
    var myMenuButtonTap: (() -> Void)?
    var recentMenuButtonTap: (() -> Void)?
    
    // MARK: - UI Components
    
    private let myMenuButton = UIButton()
    private let recentMenuButton = UIButton()
    private let editButton = UIButton()
    
    // MARK: - init
    
    init() {
        super.init(frame: .zero)
        setUI()
        setHierarchy()
        setLayout()
        setAction()
        updateUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting Method
    
    private func setUI() {
        editButton.do {
            $0.setImage(.iconPencil, for: .normal)
            $0.isHidden = false
            $0.tintColor = .black
        }
        
        myMenuButton.do {
            $0.setTitle("나만의 메뉴", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = .pretendard(.head_sb_14)
        }
        
        recentMenuButton.do {
            $0.setTitle("최근메뉴", for: .normal)
            $0.setTitleColor(.starbucksGray600, for: .normal)
            $0.titleLabel?.font = .pretendard(.caption_r_13)
        }
    }
    
    private func setHierarchy() {
        self.addSubviews(
            editButton,
            myMenuButton,
            recentMenuButton
        )
    }
    
    private func setLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(150)
            $0.height.equalTo(16)
        }
        
        editButton.snp.makeConstraints {
            $0.trailing.equalTo(myMenuButton.snp.leading).offset(-5)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(11)
            self.editButtonConstraint = $0.width.equalTo(11).constraint
        }
        
        myMenuButton.snp.makeConstraints {
            $0.trailing.equalTo(recentMenuButton.snp.leading).offset(-15)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(64)
            $0.height.equalTo(16)
        }
        
        recentMenuButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(5)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(50)
            $0.height.equalTo(16)
        }
    }
    
    private func setAction() {
        editButton.addTarget(self, action: #selector(editButtonDidTap), for: .touchUpInside)
        myMenuButton.addTarget(self, action: #selector(myMenuButtonDidTap), for: .touchUpInside)
        recentMenuButton.addTarget(self, action: #selector(recentMenuButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - UI Update
    
    private func updateUI() {
        if isMyMenuSelected {
            editButton.isHidden = false
            myMenuButton.setTitleColor(.black, for: .normal)
            myMenuButton.titleLabel?.font = .pretendard(.head_sb_14)
            recentMenuButton.setTitleColor(.starbucksGray600, for: .normal)
            recentMenuButton.titleLabel?.font = .pretendard(.caption_r_13)
        }
        else {
            editButton.isHidden = true
            myMenuButton.setTitleColor(.starbucksGray600, for: .normal)
            myMenuButton.titleLabel?.font = .pretendard(.caption_r_13)
            recentMenuButton.setTitleColor(.black, for: .normal)
            recentMenuButton.titleLabel?.font = .pretendard(.head_sb_14)
        }
        setButtonHidden(!isMyMenuSelected)
    }
    
    private func setButtonHidden(_ hide: Bool) {
        editButtonConstraint?.update(offset: hide ? 0 : 11)

        UIView.animate(withDuration: 0.25) {
            self.editButton.alpha = hide ? 0 : 1
            self.layoutIfNeeded()
        }
    }
    
    // MARK: - Target Methods
    
    @objc
    private func editButtonDidTap() {
        editButtonTap?()
    }
    
    @objc
    private func myMenuButtonDidTap() {
        myMenuButtonTap?()
        isMyMenuSelected = true
    }
    
    @objc
    private func recentMenuButtonDidTap() {
        recentMenuButtonTap?()
        isMyMenuSelected = false
    }
    
}
