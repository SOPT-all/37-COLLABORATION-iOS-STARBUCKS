//
//  MyMenuBottomView.swift
//  STARBUCKS_iOS
//
//  Created by 이서현 on 11/23/25.
//

import UIKit

import SnapKit
import Then

final class MyMenuBottomView: BaseView {
  
  // MARK: - Properties
  
  
  // MARK: - UI Components
  
  private let selectLabel = UILabel()
  private let iconDown = UIImageView()
  private let underLineView = UIView()
  private let bagIcon = UIImageView()
  private let stackView = UIStackView()
  
  // MARK: - Life Cycle
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .starbucksGray900
    setStyle()
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  //MARK: - set style
  
  private func setStyle() {
    selectLabel.do {
      $0.font = UIFont.pretendard(.caption_r_14)
      $0.textColor = .white
      $0.text = "주문할 매장을 선택해 주세요"
    }
    iconDown.do {
      $0.image = UIImage(systemName: "chevron.down")
      $0.tintColor = .white
    }
    stackView.do {
      $0.axis = .horizontal
      $0.spacing = 90
    }
    underLineView.do {
      $0.layer.backgroundColor = UIColor.starbucksGray800.cgColor
    }
    bagIcon.do {
      $0.image = .iconBag
    }
  }
  
  // MARK: - Set UI
  
  override func setUI() {
    stackView.addArrangedSubviews(selectLabel, iconDown)
    addSubviews(stackView, underLineView, bagIcon)
  }
  
  // MARK: - Set Layout
  
  override func setLayout() {
    iconDown.snp.makeConstraints {
      $0.size.equalTo(20)
    }
    stackView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(16.5)
      $0.leading.equalToSuperview().offset(22)
    }
    underLineView.snp.makeConstraints {
      $0.top.equalTo(stackView.snp.bottom).offset(7.5)
      $0.width.equalTo(287)
      $0.height.equalTo(1)
    }
    bagIcon.snp.makeConstraints {
      $0.size.equalTo(24)
      $0.centerY.equalTo(stackView)
      $0.trailing.equalToSuperview().inset(22)
    }
  }
}
