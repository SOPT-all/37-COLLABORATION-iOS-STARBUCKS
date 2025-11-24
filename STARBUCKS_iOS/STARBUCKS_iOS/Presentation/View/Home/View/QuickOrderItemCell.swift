//
//  QuickOrderItemCell.swift
//  STARBUCKS_iOS
//
//  Created by JIN on 11/19/25.
//

import UIKit

import SnapKit
import Then

struct QuickOrderItem {
    let drinkName: String
    let temperature: String
    let size: String
    let image: UIImage?
    let isFavorite: Bool
    let storeName: String?
    
    static let dummyData: [QuickOrderItem] = [
        QuickOrderItem(
            drinkName: "나만의 아이스 핑크팝 캐모마일 릴렉서",
            temperature: "ICED",
            size: "Tall",
            image: UIImage(resource: .imageRecommend4),
            isFavorite: true,
            storeName: nil
        ),
        QuickOrderItem(
            drinkName: "나만의 블랙 글레이즈드 라떼",
            temperature: "HOT",
            size: "Grande",
            image: UIImage(resource: .imageRecommend1),
            isFavorite: false,
            storeName: "스타벅스 강남점"
        )
    ]
}

final class QuickOrderItemCell: UICollectionViewCell {
    
    private let drinkImageView = UIImageView()
    private let favoriteImageView = UIImageView()
    private let titleLabel = UILabel()
    private let infoStackView = UIStackView()
    private let temperatureLabel = UILabel()
    private let separatorLabel = UILabel()
    private let sizeLabel = UILabel()
    private let footerContainer = UIView()
    private let topSeparator = UIView()
    private let storeIconView = UIImageView()
    private let storeLabel = UILabel()
    private let orderButton = UIButton()
    
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
        
        temperatureLabel.do {
            $0.font = .pretendard(.caption_r_12)
            $0.textColor = .starbucksGray600
        }
        
        separatorLabel.do {
            $0.text = "|"
            $0.font = .pretendard(.body_r_12)
            $0.textColor = .starbucksGray600
        }
        
        sizeLabel.do {
            $0.font = .pretendard(.body_r_12)
            $0.textColor = .starbucksGray600
        }
        
        infoStackView.do {
            $0.axis = .horizontal
            $0.spacing = 4
            $0.alignment = .center
            $0.addArrangedSubview(temperatureLabel)
            $0.addArrangedSubview(separatorLabel)
            $0.addArrangedSubview(sizeLabel)
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
        
        contentView.addSubviews(
            drinkImageView,
            favoriteImageView,
            titleLabel,
            infoStackView,
            footerContainer,
            topSeparator
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
            $0.width.height.equalTo(50)
        }
        
        favoriteImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(drinkImageView).offset(12)
            $0.leading.equalTo(drinkImageView.snp.trailing).offset(12)
            $0.trailing.equalTo(favoriteImageView.snp.leading).offset(-8)
        }
        
        infoStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(drinkImageView.snp.trailing).offset(12)
        }
        
        footerContainer.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(48)
            $0.top.greaterThanOrEqualTo(infoStackView.snp.bottom).offset(12)
        }
        
        storeIconView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(16)
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
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
            $0.bottom.equalTo(footerContainer.snp.top)
        }
    }
    
    func configure(with item: QuickOrderItem) {
        drinkImageView.image = item.image
        titleLabel.text = item.drinkName
        temperatureLabel.text = item.temperature
        sizeLabel.text = item.size
        favoriteImageView.isHidden = !item.isFavorite
        
        if let storeName = item.storeName {
            storeLabel.text = storeName
            storeLabel.textColor = UIColor(resource: .brown01)
        } else {
            storeLabel.text = "매장을 설정하세요."
            storeLabel.textColor = UIColor(resource: .brown01)
            
            let underlineView = UIView()
            underlineView.backgroundColor = UIColor(resource: .brown01)
            addSubview(underlineView)

            underlineView.snp.makeConstraints {
                $0.top.equalTo(storeLabel.snp.bottom)
                $0.leading.equalTo(storeLabel.snp.leading)
                $0.trailing.equalTo(storeLabel.snp.trailing)
                $0.height.equalTo(1)
            }
        }
    }
}
