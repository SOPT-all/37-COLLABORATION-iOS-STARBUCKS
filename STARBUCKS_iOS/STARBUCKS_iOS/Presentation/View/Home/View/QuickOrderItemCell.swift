//
//  QuickOrderItemCell.swift
//  STARBUCKS_iOS
//
//  Created by JIN on 11/19/25.
//

import UIKit

import Kingfisher
import SnapKit
import Then

final class QuickOrderItemCell: UICollectionViewCell {
    
    private let drinkImageView = UIImageView()
    private let favoriteImageView = UIImageView()
    private let titleLabel = UILabel()
    private let infoLabel = UILabel()
    private let footerContainer = UIView()
    private let topSeparator = UIView()
    private let storeIconView = UIImageView()
    private let storeLabel = UILabel()
    private let orderButton = UIButton()
    let underlineView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .starbucksGray100
        contentView.layer.cornerRadius = 14
        contentView.layer.masksToBounds = true
        
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        drinkImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        
        favoriteImageView.do {
            $0.image = UIImage(resource: .iconHeart)
            $0.contentMode = .scaleAspectFit
        }
        
        titleLabel.do {
            $0.font = .pretendard(.head_sb_12)
            $0.textColor = .black
            $0.numberOfLines = 2
            $0.lineBreakMode = .byWordWrapping
        }
        
        infoLabel.do {
            $0.font = .pretendard(.caption_r_12)
            $0.lineBreakMode = .byTruncatingTail
            $0.textColor = .starbucksGray600
        }
        
        footerContainer.do {
            $0.backgroundColor = .clear
        }
        
        storeIconView.do {
            $0.image = UIImage(resource: .iconLocation)
            $0.contentMode = .scaleAspectFit
        }
        
        storeLabel.do {
            $0.font = .pretendard(.caption_r_12)
            $0.text = "매장을 설정하세요."
            $0.textColor = UIColor(resource: .brown01)
        }
        
        orderButton.do {
            $0.setTitle("바로 주문하기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .pretendard(.caption_r_11)
            $0.backgroundColor = .black
            $0.layer.cornerRadius = 14
        }
        
        topSeparator.do {
            $0.backgroundColor = .starbucksGray200
        }
        
        underlineView.do {
            $0.backgroundColor = UIColor(resource: .brown01)
        }
        
        contentView.addSubviews(
            drinkImageView,
            favoriteImageView,
            titleLabel,
            infoLabel,
            footerContainer,
            topSeparator,
            underlineView
        )
        
        footerContainer.addSubviews(
            storeIconView,
            storeLabel,
            orderButton
        )
    }
    
    private func setupLayout() {
        drinkImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(16)
            $0.size.equalTo(70)
        }
        
        favoriteImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(drinkImageView).inset(16)
            $0.leading.equalTo(drinkImageView.snp.trailing)
        }
        
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(drinkImageView.snp.trailing)
            $0.width.equalTo(158)
        }
        
        footerContainer.snp.makeConstraints {
            $0.horizontalEdges.bottom.equalToSuperview()
            $0.height.equalTo(48)
            $0.top.greaterThanOrEqualTo(infoLabel.snp.bottom).offset(12)
        }
        
        storeIconView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(16)
        }
        
        storeLabel.snp.makeConstraints {
            $0.leading.equalTo(storeIconView.snp.trailing).offset(6)
            $0.centerY.equalTo(storeIconView)
        }
        
        orderButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(76)
            $0.height.equalTo(28)
        }
        
        topSeparator.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
            $0.bottom.equalTo(footerContainer.snp.top)
        }
        underlineView.snp.makeConstraints {
            $0.top.equalTo(storeLabel.snp.bottom)
            $0.leading.equalTo(storeLabel.snp.leading)
            $0.trailing.equalTo(storeLabel.snp.trailing)
            $0.height.equalTo(1)
        }
    }
    
    func configure(with item: MyMenuDTO) {
        guard let url = URL(string: item.myMenuImage) else { return }
        drinkImageView.kf.setImage(with: url)
        titleLabel.text = item.myMenuName
        infoLabel.text = item.myMenuOption
    }
}
