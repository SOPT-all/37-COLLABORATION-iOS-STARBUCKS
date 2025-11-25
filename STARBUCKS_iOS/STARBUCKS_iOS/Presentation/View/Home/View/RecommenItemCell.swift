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
        
    private let containerView = UIView()
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
                
        containerView.do {
            $0.backgroundColor = .red01
            $0.layer.cornerRadius = 61
            $0.clipsToBounds = true
        }
        
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
            containerView,
            titleLabel
        )
        
        containerView.addSubview(menuImageView)
    }
    
    private func setupLayout() {
        containerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(122)
        }
        
        menuImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(80)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(containerView.snp.bottom).offset(12)
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
            image: UIImage(named: "menu1"),
            title: "코코말차"
        ),
        RecommendMenuItem(
            image: UIImage(named: "menu2"),
            title: "아이스 윈터 스카치 바닐라 라떼"
        ),
        RecommendMenuItem(
            image: UIImage(named: "menu3"),
            title: "토피넛 라떼"
        )
    ]
}
