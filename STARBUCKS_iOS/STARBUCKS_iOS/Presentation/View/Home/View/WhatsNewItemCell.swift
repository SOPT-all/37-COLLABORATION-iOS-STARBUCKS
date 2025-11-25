//
//  WhatsNewItemCell.swift
//  STARBUCKS_iOS
//
//  Created by JIN on 11/21/25.
//

import UIKit

import SnapKit
import Then


final class WhatsNewItemCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let cardImageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        contentView.backgroundColor = .white
        contentView.clipsToBounds = true
        
        cardImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.backgroundColor = .starbucksGray200
            $0.layer.cornerRadius = 12
        }
        
        titleLabel.do {
            $0.font = .pretendard(.head_m_16)
            $0.textColor = .black
        }
        
        descriptionLabel.do {
            $0.font = .pretendard(.caption_r_12)
            $0.textColor = .starbucksGray600
            $0.numberOfLines = 2
        }
        
        contentView.addSubviews(
            cardImageView,
            titleLabel,
            descriptionLabel
        )
    }
    
    private func setupLayout() {
        cardImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(150)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(cardImageView.snp.bottom).offset(11)
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().offset(-12)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().offset(-12)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    // MARK: - Configuration
    
    func configure(with item: WhatsNewItem) {
        cardImageView.image = item.image
        titleLabel.text = item.title
        descriptionLabel.text = item.description
    }
}


// MARK: - WhatsNewItem

struct WhatsNewItem {
    let image: UIImage?
    let title: String
    let description: String
    
    static let dummyData: [WhatsNewItem] = [
        WhatsNewItem(
            image: UIImage(),
            title: "각인 뉴턴 캔디 핑크 텀블러 355...",
            description: "러블리한 핑크빛 각인 텀블러를 쓱데이 헤택과 함께 만나보세요!"
        ),
        WhatsNewItem(
            image: UIImage(),
            title: "2025 WINTER e-F...",
            description: "스타벅스 삼성카드로 2025 WINTER e-FREQUENCY 참여시 별★..."
        ),
        WhatsNewItem(
            image: UIImage(),
            title: "새로운 소식 3",
            description: "세 번째 소식입니다"
        )
    ]}
