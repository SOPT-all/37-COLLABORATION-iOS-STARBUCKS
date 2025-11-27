//
//  MyMenuCollectionViewCell.swift
//  STARBUCKS_iOS
//
//  Created by 이서현 on 11/18/25.
//

import UIKit

import Kingfisher
import SnapKit
import Then

protocol MyMenuCollectionViewCellDelegate: AnyObject {
    func didTapaddMenuButton(in cell: MyMenuCollectionViewCell)
}

final class MyMenuCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    static let identifier = "MyMenuCollectionViewCell"
    
    private let imageView = UIImageView()
    private let customNameLabel = UILabel()
    private let officialNameLabel = UILabel()
    private let detailLabel = UILabel()
    private let priceLabel = UILabel()
    private lazy var editButton = UIButton()
    private lazy var deleteButton = UIButton()
    private lazy var addMenuButton = UIButton()
    private lazy var orderButton = UIButton()
    private let dividerView = UIView()
    private var titleStackView = UIStackView()
    private var buttonStackView = UIStackView()

    weak var delegate: MyMenuCollectionViewCellDelegate?
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setLayout()
        
        contentView.layoutIfNeeded()
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Set Style
    
    private func setStyle() {
        imageView.do {
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
        }
        
        customNameLabel.do {
            $0.font = UIFont.pretendard(.head_m_15)
            $0.textColor = .black
        }
        
        officialNameLabel.do {
            $0.font = UIFont.pretendard(.caption_r_13)
            $0.textColor = .starbucksGray600
        }
        
        detailLabel.do {
            $0.font = UIFont.pretendard(.caption_r_13)
            $0.textColor = .starbucksGray600
            $0.numberOfLines = 1
            $0.lineBreakMode = .byTruncatingTail
        }
        
        priceLabel.do {
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
        
        buttonStackView.do {
            $0.axis = .horizontal
            $0.spacing = 11
            $0.alignment = .center
        }
        
        dividerView.do {
            $0.backgroundColor = .starbucksGray200
        }
        addMenuButton.addTarget(self, action: #selector(addMenuButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Set UI
    
    private func setUI() {
        contentView.addSubviews(
            imageView,
            officialNameLabel,
            detailLabel,
            priceLabel,
            deleteButton,
            titleStackView,
            buttonStackView,
            dividerView
        )
        
        titleStackView.addArrangedSubviews(
            customNameLabel,
            editButton
        )
        
        buttonStackView.addArrangedSubviews(
            addMenuButton,
            orderButton
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
            $0.trailing.equalTo(contentView).inset(16)
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
        
        officialNameLabel.snp.makeConstraints {
            $0.top.equalTo(titleStackView.snp.bottom).offset(6)
            $0.leading.equalTo(titleStackView)
        }
        
        detailLabel.snp.makeConstraints {
            $0.top.equalTo(officialNameLabel.snp.bottom).offset(6)
            $0.leading.equalTo(titleStackView)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(detailLabel.snp.bottom).offset(6)
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
            $0.top.equalTo(priceLabel.snp.bottom).offset(12.5)
            $0.trailing.equalTo(contentView).inset(16)
            $0.bottom.equalTo(contentView)
        }
    }
    
    // MARK: - Method
    
    func setPrice(_ price: String) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        if let intValue = Int(price),
           let formatted = formatter.string(from: NSNumber(value: intValue)) {
            priceLabel.text = "\(formatted)원"
        } else {
            priceLabel.text = "\(price)원"
        }
    }
    
    func configure(with model: MyMenuModel) {
        customNameLabel.text = model.customName
        officialNameLabel.text = model.officialName
        detailLabel.text = model.detail
        setPrice(model.price)
        if let url = URL(string: model.imageName) {
            imageView.kf.setImage(with: url)
        }
    }
    
    @objc private func addMenuButtonTapped() {
        delegate?.didTapaddMenuButton(in: self)
    }
}
