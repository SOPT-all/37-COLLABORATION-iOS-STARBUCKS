//
//  FinalCardCell.swift
//  STARBUCKS_iOS
//
//  Created by JIN on 11/27/25.
//

import UIKit

import SnapKit
import Then

final class FinalCardCell: UICollectionViewCell {
  
    // MARK: - UI Components
    
    private let containerView = UIView()
    private let dividerView = UIView()
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let arrowCircleView = UIView()
    private let arrowImageView = UIImageView()
    private let dashedLayer = CAShapeLayer()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateDashedBorder()
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        
        containerView.do {
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
        }
        
        iconImageView.do {
            $0.image = .imageHomeQuickorder
            $0.contentMode = .scaleAspectFit
        }
        
        titleLabel.do {
            $0.text = "나만의 메뉴를 등록하고\nHome에서 빠르게 주문해\n보세요 😊"
            $0.font = .pretendard(.head_sb_12)
            $0.textColor = .starbucksGray900
            $0.numberOfLines = 3
        }
        
        subtitleLabel.do {
            $0.text = "음료,푸드만 주문 가능합니다"
            $0.font = .pretendard(.caption_r_12)
            $0.textColor = .starbucksGray600
        }
        
        dividerView.do {
            $0.backgroundColor = .starbucksGray300
        }
        
        arrowCircleView.do {
            $0.backgroundColor = .starbucksGray100
            $0.layer.cornerRadius = 20
        }
        
        arrowImageView.do {
            $0.image = UIImage(systemName: "chevron.right")
            $0.tintColor = .starbucksGray500
            $0.contentMode = .scaleAspectFill
        }
        
        contentView.addSubview(containerView)
        containerView.addSubviews(
            iconImageView,
            titleLabel,
            subtitleLabel,
            dividerView,
            arrowCircleView
        )
        arrowCircleView.addSubview(arrowImageView)
    }
    
    private func setupLayout() {
        
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(24)
            $0.width.equalTo(25)
            $0.height.equalTo(50)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(iconImageView)
            $0.leading.equalTo(iconImageView.snp.trailing).offset(16)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        dividerView.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        arrowCircleView.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(25)
            $0.bottom.lessThanOrEqualToSuperview().inset(12)
        }
        
        arrowImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(8)
            $0.height.equalTo(16)
        }
    }
    
    // MARK: - Dashed Border
    
    private func updateDashedBorder() {
        dashedLayer.removeFromSuperlayer()
        
        let path = UIBezierPath(
            roundedRect: containerView.bounds,
            cornerRadius: 8
        )
        
        dashedLayer.do {
            $0.path = path.cgPath
            $0.strokeColor = UIColor.starbucksGray300.cgColor
            $0.fillColor = UIColor.clear.cgColor
            $0.lineWidth = 1.5
            $0.lineDashPattern = [8, 6]
            $0.lineCap = .round
        }
        
        containerView.layer.addSublayer(dashedLayer)
    }
}
