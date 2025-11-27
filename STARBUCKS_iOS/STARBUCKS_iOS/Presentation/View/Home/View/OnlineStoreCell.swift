//
//  OnlineStoreCell.swift
//  STARBUCKS_iOS
//
//  Created by JIN on 11/18/25.
//

import UIKit

import SnapKit
import Then

final class OnlineStoreCell: UITableViewCell {

    // MARK: - UI Components

    private let titleLabel = UILabel()
    private let backgroundView1 = UIView()
    private let bannerTitleLabel1 = UILabel()
    private let bannerContentLabel1 = UILabel()
    private let bannerDateLabel1 = UILabel()
    private let storeImageView1 = UIImageView()
    private let backgroundView2 = UIView()
    private let bannerTitleLabel2 = UILabel()
    private let bannerContentLabel2 = UILabel()
    private let storeImageView2 = UIImageView()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        setStyle()
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Style

    func setStyle() {
        titleLabel.do {
            $0.text = "STARBUCKS ONLINE STORE"
            $0.font = .pretendard(.head_sb_18)
            $0.textColor = .black
        }
        
        backgroundView1.do {
            $0.backgroundColor = .red02
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
        }
        
        bannerTitleLabel1.do {
            $0.text = "ONLINE STORE"
            $0.font = .pretendard(.body_m_16)
            $0.textColor = .red01
        }
        
        bannerContentLabel1.do {
            let fullText = "매일 펼쳐지는 새로움! 단 11일, 쓱데이 한정 혜택을 만나보세요"
            let attributedText = NSMutableAttributedString(
                string: fullText,
                attributes: [
                    .font: UIFont.pretendard(.body_m_16),
                    .foregroundColor: UIColor.black
                ]
            )
            
            if let range = fullText.range(of: "쓱데이") {
                let nsRange = NSRange(range, in: fullText)
                attributedText.addAttribute(.foregroundColor, value: UIColor.red01, range: nsRange)
            }
            
            $0.attributedText = attributedText
            $0.numberOfLines = 0
        }
        
        bannerDateLabel1.do {
            $0.text = "2025. 10. 30 (목) - 11. 9 (일)"
            $0.font = .pretendard(.caption_r_12)
            $0.textColor = .starbucksGray600
        }
        
        storeImageView1.do {
            $0.image = .imageHomeBanner2
            $0.contentMode = .scaleAspectFit
        }
        
        backgroundView2.do {
            $0.backgroundColor = .yellow03
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
        }
        
        bannerTitleLabel2.do {
            $0.text = "ONLINE STORE"
            $0.font = .pretendard(.body_m_16)
            $0.textColor = .yellow01
        }
        
        bannerContentLabel2.do {
            let fullText = "Make Every Moment\nSweeter! 하트로\n달콤한 사랑을 전해보세요"
            let attributedText = NSMutableAttributedString(
                string: fullText,
                attributes: [
                    .font: UIFont.pretendard(.body_m_16),
                    .foregroundColor: UIColor.black
                ]
            )
                        
            if let range = fullText.range(of: "하트") {
                let nsRange = NSRange(range, in: fullText)
                attributedText.addAttribute(.foregroundColor, value: UIColor.yellow01, range: nsRange)
            }
            
            if let range = fullText.range(of: "달콤한 사랑") {
                let nsRange = NSRange(range, in: fullText)
                attributedText.addAttribute(.foregroundColor, value: UIColor.yellow01, range: nsRange)
            }
            
            $0.attributedText = attributedText
            $0.numberOfLines = 0
        }
        
        storeImageView2.do {
            $0.image = .imageHomeBanner3
            $0.contentMode = .scaleAspectFit
        }
    }

    // MARK: - UI

    func setUI() {
        contentView.addSubviews(
            titleLabel,
            backgroundView1,
            backgroundView2)
        
        backgroundView1.addSubviews(
            bannerTitleLabel1,
            bannerContentLabel1,
            bannerDateLabel1,
            storeImageView1
        )
        
        backgroundView2.addSubviews(
            bannerTitleLabel2,
            bannerContentLabel2,
            storeImageView2
        )
    }

    // MARK: - Layout

    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
        }

        backgroundView1.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(168)
        }
        
        bannerTitleLabel1.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        
        bannerContentLabel1.snp.makeConstraints {
            $0.top.equalTo(bannerTitleLabel1.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(148)
        }
        
        bannerDateLabel1.snp.makeConstraints {
            $0.top.equalTo(bannerContentLabel1.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(20)
        }
        
        storeImageView1.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(109)
            $0.height.equalTo(117)
        }
        
        backgroundView2.snp.makeConstraints {
            $0.top.equalTo(backgroundView1.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(168)
            $0.bottom.equalToSuperview().inset(20)
        }
        
        bannerTitleLabel2.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.leading.equalToSuperview().offset(20)
        }
        
        bannerContentLabel2.snp.makeConstraints {
            $0.top.equalTo(bannerTitleLabel2.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(161)
        }
        
        storeImageView2.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(115)
            $0.height.equalTo(120)
        }
    }
}
