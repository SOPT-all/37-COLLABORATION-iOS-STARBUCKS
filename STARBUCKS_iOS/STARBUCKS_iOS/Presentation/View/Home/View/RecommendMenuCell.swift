
//
//  RecommendMenuCell.swift
//  STARBUCKS_iOS
//
//  Created by JIN on 11/19/25.
//

import UIKit

import SnapKit
import Then

final class RecommendMenuCell: UITableViewCell {
    
    private let userName: String = "가요이"
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let collectionViewLayout = UICollectionViewFlowLayout()
    
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: collectionViewLayout
    )
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupLayout()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        
        contentView.backgroundColor = .white
        selectionStyle = .none
        
        titleLabel.do {
            $0.font = .pretendard(.head_sb_18)
            $0.textColor = .black
        }
        
        subtitleLabel.do {
            $0.text = "최근 주문과 취향을 바탕으로, 지금 딱 어울리는 추천 메뉴를 \n준비했어요✨"
            $0.font = .pretendard(size: 13)
            $0.textColor = .darkGray
            $0.numberOfLines = 0
        }
        
        collectionViewLayout.do {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = 12
            $0.minimumInteritemSpacing = 0
            $0.sectionInset = UIEdgeInsets(
                top: 0, left: 16, bottom: 0, right: 16
            )
        }
        
        collectionView.do {
            $0.backgroundColor = .clear
            $0.showsHorizontalScrollIndicator = false
            $0.delegate = self
            $0.dataSource = self
            $0.register(
                RecommendMenuItemCell.self,
                forCellWithReuseIdentifier: RecommendMenuItemCell.identifier
            )
        }
        
        contentView.addSubviews(
            titleLabel,
            subtitleLabel,
            collectionView
        )
    }
    
    // MARK: - Layout
    
    private func setupLayout() {
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(186)
            $0.bottom.equalToSuperview().inset(20)
        }
    }
    
    // MARK: - Configuration
    
    private func configure() {
        titleLabel.text = "\(userName)님을 위한 추천메뉴"
    }
}

// MARK: - UICollectionViewDataSource

extension RecommendMenuCell: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return RecommendMenuItem.dummyItems.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RecommendMenuItemCell.identifier,
            for: indexPath
        ) as? RecommendMenuItemCell else {
            return UICollectionViewCell()
        }
        
        let item = RecommendMenuItem.dummyItems[indexPath.row]
        cell.configure(with: item)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension RecommendMenuCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: 122, height: 186)
    }
}

