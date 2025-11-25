//
//  DrinkInfoHeaderView.swift
//  STARBUCKS_iOS
//
//  Created by 진소은 on 11/20/25.
//

import UIKit

import SnapKit
import Then

final class DrinkInfoHeaderView: BaseView {
    
    // MARK: - UI Components
    
    var imageView = UIImageView()
    private var scanButton = UIButton()
    
    private let nameStackView = UIStackView()
    private var drinkNameLabel = UILabel()
    private let newLabel = UILabel()
    private let drinkEngNameLabel = UILabel()
    private let drinkDetailLabel = UILabel()

    private var priceLabel = UILabel()

    private let noticeView = UIView()
    private let warningLabel = UILabel()
    private let noticeLabel = UILabel()
    
    // MARK: - Set UI
    
    override func setUI() {
        self.addSubviews(imageView, scanButton, nameStackView, drinkEngNameLabel, drinkDetailLabel, priceLabel, noticeView)
        nameStackView.addArrangedSubviews(drinkNameLabel, newLabel)
        noticeView.addSubviews(warningLabel, noticeLabel)
        
        self.backgroundColor = .white
        
        imageView.do {
            $0.image = UIImage(resource: .imageRecommend2)
            $0.contentMode = .scaleAspectFill
        }
        
        scanButton.do {
            $0.setImage(.icon, for: .normal)
        }
        
        nameStackView.do {
            $0.axis = .horizontal
            $0.distribution = .fill
            $0.alignment = .center
        }
        
        drinkNameLabel.do {
            $0.font = .pretendard(.head_b_21)
            $0.textColor = .black
        }
        
        newLabel.do {
            $0.text = "New"
            $0.font = .pretendard(.body_r_13)
            $0.textColor = .starbucksGreen500
        }
        
        drinkEngNameLabel.do {
            $0.font = .pretendard(.caption_r_13)
            $0.textColor = .starbucksGray600
        }
        
        drinkDetailLabel.do {
            $0.font = .pretendard(.caption_r_13)
            $0.textColor = .starbucksGray700
            $0.numberOfLines = 0
        }
        
        priceLabel.do {
            $0.font = .pretendard(.body_b_22)
            $0.textColor = .black
        }
        
        noticeView.do {
            $0.layer.cornerRadius = 6
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor(.starbucksGray200).cgColor
            $0.layer.masksToBounds = true
        }
        
        warningLabel.do {
            $0.text = "  * 리치 과육의 속 껍질이 있을 수 있지만 안심하고 드세요."
            $0.font = .pretendard(.caption_r_11)
            $0.textColor = .starbucksGray600
            $0.textAlignment = .left
        }
        
        noticeLabel.do {
            $0.text = "  * 대체당(효소처리 스테비아)을 일부 사용하여 당과\n 칼로리를 낮췄습니다."
            $0.font = .pretendard(.caption_r_11)
            $0.textColor = .starbucksGray600
            $0.numberOfLines = 0
            $0.textAlignment = .left
            $0.lineBreakMode = .byWordWrapping
        }
    }
    
    // MARK: - Set Layout
    
    override func setLayout() {
        imageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(400)
        }
        
        scanButton.snp.makeConstraints {
            $0.trailing.bottom.equalTo(imageView).inset(17)
        }
        
        nameStackView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(25)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(34)
        }
        
        drinkEngNameLabel.snp.makeConstraints {
            $0.top.equalTo(nameStackView.snp.bottom)
            $0.horizontalEdges.equalTo(16)
        }
        
        drinkDetailLabel.snp.makeConstraints {
            $0.top.equalTo(drinkEngNameLabel.snp.bottom).offset(3.5)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(51)
            $0.width.equalTo(321)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(drinkDetailLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(16)
        }
        
        warningLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(13)
            $0.leading.equalToSuperview().inset(9)
        }
        
        noticeLabel.snp.makeConstraints {
            $0.top.equalTo(warningLabel.snp.bottom).offset(3)
            $0.leading.equalToSuperview().inset(9)
            $0.bottom.equalToSuperview().inset(13)
        }
        
        noticeView.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }
    }
    

    public func setDrinkName(_ name: String) {
        drinkNameLabel.text = name
    }
    
    public func setInfo(name: String, engName: String, detail: String) {
        drinkNameLabel.text = name
        drinkEngNameLabel.text = engName
        drinkDetailLabel.text = detail
    }

    public func setPrice(_ price: Int) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal

        let formatted = formatter.string(from: NSNumber(value: price)) ?? "\(price)"
        priceLabel.text = "\(formatted)원"
    }
}
