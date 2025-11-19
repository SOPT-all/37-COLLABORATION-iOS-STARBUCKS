//
//  MyMenuCollectionViewCell.swift
//  STARBUCKS_iOS
//
//  Created by 이서현 on 11/18/25.
//

import UIKit

import SnapKit
import Then

class MyMenuCollectionViewCell: UICollectionViewCell {
  
  // MARK: - Properties
  
  static let identifier = "MyMenuCollectionViewCell"
  
  private let imageView = UIImageView()
  private let customName = UILabel()
  private let officalName = UILabel()
  private let detail = UILabel()
  private let price = UILabel()
  private lazy var editButton = UIButton()
  private lazy var deleteButton = UIButton()
  private lazy var addMenuButton = UIButton()
  private lazy var orderButton = UIButton()
  private let dividerView = UIView()
  
  private var titleStackView = UIStackView()
  private var buttonStackView = UIStackView()
  
  
  // MARK: - UI Components
  
  private func setStyle() {
    imageView.do {
      $0.clipsToBounds = true
      $0.contentMode = .scaleAspectFill
    }
    
    customName.do {
      $0.font = UIFont.pretendard(.head_m_15)
      $0.textColor = .black
    }
    
    officalName.do {
      $0.font = UIFont.pretendard(.caption_r_13)
      $0.textColor = .starbucksGray600
    }
    
    detail.do {
      $0.font = UIFont.pretendard(.caption_r_13)
      $0.textColor = .starbucksGray600
    }
    
    price.do {
      $0.font = UIFont.pretendard(.head_sb_14)
      $0.textColor = .black
    }
    
    editButton.do {
      $0.setImage(.iconPencil, for: .normal)
    }
    
    deleteButton.do {
      $0.setImage(.iconDelete, for: .normal)
    }
    
    addMenuButton.do {
      $0.setTitle("담기", for: .normal)
      $0.setTitleColor(.starbucksGreen500, for: .normal)
      $0.titleLabel?.font = UIFont.pretendard(.caption_r_13)
      $0.layer.borderWidth = 1
      $0.layer.cornerRadius = 15
      $0.layer.borderColor = UIColor.starbucksGreen500.cgColor
      $0.clipsToBounds = true
    }
    
    orderButton.do {
      $0.setTitle("주문하기", for: .normal)
      $0.setTitleColor(.white, for: .normal)
      $0.titleLabel?.font = UIFont.pretendard(.caption_r_13)
      $0.layer.backgroundColor = UIColor.starbucksGreen500.cgColor
      $0.layer.borderWidth = 1
      $0.layer.cornerRadius = 15
      $0.layer.borderColor = UIColor.white.cgColor
      $0.clipsToBounds = true
    }
    
    titleStackView.do {
      $0.axis = .horizontal
      $0.spacing = 4
      $0.alignment = .center
    }
    
    titleStackView.addArrangedSubview(customName)
    titleStackView.addArrangedSubview(editButton)
    
    buttonStackView.do {
      $0.axis = .horizontal
      $0.spacing = 11
      $0.alignment = .center
    }
    
    buttonStackView.addArrangedSubview(addMenuButton)
    buttonStackView.addArrangedSubview(orderButton)
    
    dividerView.do {
      $0.backgroundColor = .starbucksGray200
    }
  }
  
  
  // MARK: - Life Cycle
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setStyle()
    setUI()
    setLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  
  // MARK: - Set UI
  
  private func setUI() {
    contentView.addSubviews(
      imageView,
      officalName,
      detail,
      price,
      deleteButton,
      titleStackView,
      buttonStackView,
      dividerView
    )
  }
  
  // MARK: - Set Layout
  
  private func setLayout() {
    dividerView.snp.makeConstraints {
      $0.top.equalTo(contentView).offset(10)
      $0.leading.equalTo(contentView)
      $0.trailing.equalTo(contentView)
      $0.height.equalTo(1)
    }
    
    deleteButton.snp.makeConstraints {
      $0.top.equalTo(dividerView).offset(12)
      $0.trailing.equalTo(contentView).offset(-16)
    }
    
    imageView.snp.makeConstraints {
      $0.top.equalTo(deleteButton.snp.bottom).offset(8)
      $0.leading.equalTo(contentView).offset(16)
      $0.size.equalTo(CGSize(width: 94, height: 94))
    }
    
    titleStackView.snp.makeConstraints {
      $0.top.equalTo(imageView).offset(5)
      $0.leading.equalTo(imageView.snp.trailing).offset(24)
    }
    
    officalName.snp.makeConstraints {
      $0.top.equalTo(titleStackView.snp.bottom).offset(6)
      $0.leading.equalTo(titleStackView)
    }
    
    detail.snp.makeConstraints {
      $0.top.equalTo(officalName.snp.bottom).offset(6)
      $0.leading.equalTo(titleStackView)
    }
    
    price.snp.makeConstraints {
      $0.top.equalTo(detail.snp.bottom).offset(6)
      $0.leading.equalTo(titleStackView)
    }
    
    addMenuButton.snp.makeConstraints {
      $0.width.equalTo(46)
      $0.height.equalTo(30)
    }
    
    orderButton.snp.makeConstraints {
      $0.width.equalTo(67)
      $0.height.equalTo(30)
    }
    
    buttonStackView.snp.makeConstraints {
      $0.top.equalTo(price.snp.bottom).offset(12.5)
      $0.trailing.equalTo(contentView).offset(-16)
      $0.bottom.equalTo(contentView)
    }
  }
  
  
  // MARK: - Private Methods
  
  func configure(with model: MyMenuModel) {
    customName.text = model.customName
    officalName.text = model.officialName
    detail.text = model.detail
    price.text = model.price
    imageView.image = .imageHomeBanner7
  }
}

#Preview {
    MyMenuCollectionViewCell().then {
        $0.configure(with: MyMenuModel(
            id: 1,
            customName: "나의 아메리카노",
            officialName: "아이스 아메리카노",
            detail: "진한 에스프레소와 시원한 물의 조화",
            price: "4,500원",
            imageName: .imageHomeBanner7,
            category: .drink
        ))
    }
}
