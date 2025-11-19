//
//  Alert.swift
//  STARBUCKS_iOS
//
//  Created by 안치욱 on 11/18/25.
//

import UIKit

import SnapKit
import Then

final class Alert: UIView {
    
    // MARK: - Properties
    
    private let type: AlertType
    private let subTitle: String
    var cancelButtonTap: (() -> Void)?
    var confirmButtonTap: (() -> Void)?
    
    // MARK: - UI Components
    
    private let alertLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let cancelButton = UIButton()
    private let confirmButton = UIButton()
    private let seperator = UIView()
    private let overLine = UIView()
    
    // MARK: - init
    
    init(type: AlertType, subtitle: String = "전체 초기화하면 설정하신 퍼스널 옵션을 되돌릴 수 없어요.") {
        self.type = type
        self.subTitle = subtitle
        super.init(frame: .zero)
        setUI()
        setHierarchy()
        setLayout()
        setAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting Methods
    
    private func setUI() {
        self.layer.cornerRadius = 5
        self.backgroundColor = .white
        
        alertLabel.do {
            $0.text = type.title
            $0.font = UIFont.pretendard(.head_b_17)
            $0.textColor = .black
        }
        
        subTitleLabel.do {
            $0.text = subTitle
            $0.font = UIFont.pretendard(.body_r_15)
            $0.numberOfLines = type.numberOfLines
            $0.textColor = .starbucksGray600
        }
        
        overLine.do {
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.starbucksGray100.cgColor
        }
        
        seperator.do {
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.starbucksGray100.cgColor
        }
        
        cancelButton.do {
            $0.setTitle(type.cancelTitle, for: .normal)
            $0.titleLabel?.font = UIFont.pretendard(.body_m_16)
            $0.setTitleColor(.starbucksGray600, for: .normal)
        }
        
        confirmButton.do {
            $0.setTitle(type.confirmTitle, for: .normal)
            $0.titleLabel?.font = UIFont.pretendard(.body_m_16)
            $0.setTitleColor(.starbucksGreen400, for: .normal)
        }
        
    }
    
    private func setHierarchy() {
        self.addSubviews(
            alertLabel,
            subTitleLabel,
            cancelButton,
            confirmButton,
            overLine,
            seperator
        )
    }
    
    private func setLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(type.width)
            $0.height.equalTo(type.height)
        }
        
        alertLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.leading.equalToSuperview().inset(27)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(alertLabel.snp.bottom).offset(15)
            $0.leading.equalTo(alertLabel)
            $0.width.equalTo(279)
        }
        
        overLine.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(cancelButton.snp.top)
            $0.height.equalTo(1)
        }
        
        seperator.snp.makeConstraints {
            $0.top.bottom.equalTo(cancelButton)
            $0.leading.equalTo(cancelButton.snp.trailing)
            $0.width.equalTo(1)
        }
        
        cancelButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(164)
            $0.height.equalTo(57)
        }
        
        confirmButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(164)
            $0.height.equalTo(57)
        }
    }
    
    private func setAction() {
        cancelButton.addTarget(self, action: #selector(cancelButtonDidTap), for: .touchUpInside)
        confirmButton.addTarget(self, action: #selector(confirmButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func cancelButtonDidTap() {
        cancelButtonTap?()
        self.removeFromSuperview()
    }
    
    @objc
    private func confirmButtonDidTap() {
        confirmButtonTap?()
        self.removeFromSuperview()
    }
    
}
