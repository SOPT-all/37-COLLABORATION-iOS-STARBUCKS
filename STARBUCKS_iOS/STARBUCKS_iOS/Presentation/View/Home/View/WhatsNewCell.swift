//
//  WhatsNewCell.swift
//  STARBUCKS_iOS
//
//  Created by JIN on 11/18/25.
//

import UIKit

import SnapKit
import Then

final class WhatsNewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let seeAllLabel = UILabel()
    private let collectionViewLayout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: self.collectionViewLayout
    )
    
    // MARK: - Properties
    
    private var items: [WhatsNewItem] = WhatsNewItem.dummyData
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        self.contentView.backgroundColor = .white
        self.selectionStyle = .none
        
        titleLabel.do {
            $0.text = "What's New"
            $0.font = .pretendard(.head_sb_18)
            $0.textColor = .black
        }
        
        seeAllLabel.do {
            $0.text = "See all"
            $0.font = .pretendard(.body_sb_13)
            $0.textColor = .starbucksGreen500
        }
        
        collectionViewLayout.do {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = 12
            $0.minimumInteritemSpacing = 0
            $0.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        }
        
        collectionView.do {
            $0.backgroundColor = .clear
            $0.showsHorizontalScrollIndicator = false
            $0.delegate = self
            $0.dataSource = self
            $0.register(WhatsNewItemCell.self, forCellWithReuseIdentifier: WhatsNewItemCell.identifier)
        }
        
        contentView.addSubviews(
            titleLabel,
            seeAllLabel,
            collectionView
        )
    }
    
    private func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(26)
        }
        
        seeAllLabel.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-26)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(11)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(269)
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Configuration
    
    func configure(with items: [WhatsNewItem]) {
        self.items = items
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource

extension WhatsNewCell: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return items.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: WhatsNewItemCell.identifier,
            for: indexPath
        ) as? WhatsNewItemCell else {
            return UICollectionViewCell()
        }
        
        let item = items[indexPath.item]
        cell.configure(with: item)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension WhatsNewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: 225, height: 222)
    }
}
