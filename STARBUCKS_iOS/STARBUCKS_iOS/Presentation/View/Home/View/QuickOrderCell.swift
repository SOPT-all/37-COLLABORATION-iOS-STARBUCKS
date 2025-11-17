//
//  quickOrderCell.swift
//  STARBUCKS_iOS
//
//  Created by JIN on 11/18/25.
//

import UIKit

import SnapKit
import Then

final class QuickOrderCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 12
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        return collectionView
    }()
    
    // MARK: - UIComponents

    private let titleLabel = UILabel()

    // MARK: - initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .blue02
        setUIComponents()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUIComponents() {
        titleLabel.do {
            $0.text = "Quick Order"
            $0.font = .preferredFont(forTextStyle: .subheadline)
            $0.textColor = .black
        }
    }
    
}


// MARK: - UI & Layout
extension QuickOrderCell {
    
    private func setUI() {
        contentView.addSubviews(titleLabel, mainCollectionView)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(16)
        }
        
        mainCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(150)  // 임시 높이, 필요에 따라 조정
        }
    }
}

extension QuickOrderCell: UICollectionViewDelegate {
    
}

extension QuickOrderCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

extension QuickOrderCell: UICollectionViewDelegateFlowLayout {
    
}
