//
//  RecommenItemCell.swift
//  STARBUCKS_iOS
//
//  Created by JIN on 11/19/25.
//

import UIKit

import SnapKit
import Then

// MARK: - RecommendMenuItemCell

final class RecommendMenuItemCell: UICollectionViewCell {
        
    private let menuImageView = UIImageView()
    private let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        menuImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
        }
        
        titleLabel.do {
            $0.font = .pretendard(.caption_r_13)
            $0.textColor = .starbucksGray900
            $0.textAlignment = .center
            $0.numberOfLines = 2
        }
        
        contentView.addSubviews(
            menuImageView,
            titleLabel
        )
        
     }
    
    private func setupLayout() {
        menuImageView.snp.makeConstraints {
            $0.top.equalToSuperview()           // ✅ 상단 고정
            $0.centerX.equalToSuperview()  
            $0.width.height.equalTo(122)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(menuImageView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.lessThanOrEqualToSuperview()
        }
    }
    
    func configure(with item: RecommendMenuItem) {
        menuImageView.image = item.image
        titleLabel.text = item.title
    }
}


// MARK: - RecommendMenuItem

struct RecommendMenuItem {
    let image: UIImage?
    let title: String
    
    static let dummyItems: [RecommendMenuItem] = [
        RecommendMenuItem(
            image: UIImage(resource: .imageHomeMenu3),
            title: "코코말차"
        ),
        RecommendMenuItem(
            image: UIImage(resource: .imageHomeMenu1),
            title: "아이스 윈터 스카치 바닐라 라떼"
        ),
        RecommendMenuItem(
            image: UIImage(resource: .imageHomeMenu2),
            title: "토피넛 라떼"
        ),
        RecommendMenuItem(
            image: UIImage(resource: .imageHomeMenu),
            title: "카페 아메리카노"
        )
    ]
}
