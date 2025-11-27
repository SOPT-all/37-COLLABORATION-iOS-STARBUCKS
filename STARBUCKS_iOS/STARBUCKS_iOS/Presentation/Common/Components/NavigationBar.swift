//
//  NavigationBar.swift
//  STARBUCKS_iOS
//
//  Created by 안치욱 on 11/17/25.
//

import UIKit

import SnapKit
import Then

final class NavigationBar: UIView {
    
    // MARK: - Properties
    
    private let naviType: NaviType
    var leftButtonHandler: (() -> Void)?
    
    // MARK: - UI Components
    
    private let leftButton = UIButton()
    private let rightButton = UIButton()
    
    init(type: NaviType) {
        self.naviType = type
        super.init(frame: .zero)
        setUI()
        setLayout()
        setAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUI() {
        self.backgroundColor = .clear
        
        leftButton.do {
            $0.setImage(naviType.leftIcon, for: .normal)
        }
        
        rightButton.do {
            $0.setImage(naviType.rightIcon, for: .normal)
        }
        
        addSubviews(
            leftButton,
            rightButton
        )
    }
    
    private func setLayout() {
        leftButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
            $0.size.equalTo(naviType.iconSize)
        }
        
        rightButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(naviType.iconSize)
        }
    }
    
    private func setAction() {
        leftButton.addTarget(self, action: #selector(leftButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Method
    
    @objc
    private func leftButtonDidTap() {
        leftButtonHandler?()
    }
    
}

enum NaviType: CaseIterable {
    case search
    case share
}

extension NaviType {
    var leftIcon: UIImage? {
        switch self {
        case .search: return .iconBackVector
        case .share: return .iconBack
        }
    }
    
    var rightIcon: UIImage? {
        switch self {
        case .search: return .iconSearch
        case .share: return .iconShare
        }
    }
    
    var iconSize: CGFloat {
        switch self {
        case .search: return 24
        case .share: return 33
        }
    }
}
