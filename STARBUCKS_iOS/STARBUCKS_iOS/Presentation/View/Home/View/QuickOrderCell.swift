//
//  QuickOrderCell.swift
//  STARBUCKS_iOS
//
//  Created by JIN on 11/18/25.
//

import UIKit

import SnapKit
import Then

final class QuickOrderCell: UITableViewCell {
  
  private lazy var mainCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumInteritemSpacing = 16
    layout.minimumLineSpacing = 16

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .clear
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(
      QuickOrderItemCell.self,
      forCellWithReuseIdentifier: QuickOrderItemCell.identifier
    )
    collectionView.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    
    return collectionView
  }()
  
  private let titleLabel = UILabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    self.backgroundColor = .clear
    self.setUI()
    self.setLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - UI & Layout

extension QuickOrderCell {
  
  private func setUI() {
    self.titleLabel.do {
      $0.text = "Quick Order"
      $0.font = .pretendard(weight: .Bold, size: 24)
      $0.textColor = .black
    }
    
    self.contentView.addSubviews(self.titleLabel, self.mainCollectionView)
  }
  
  private func setLayout() {
    self.titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().inset(12)
      $0.leading.equalToSuperview().inset(20)
    }
    
    self.mainCollectionView.snp.makeConstraints {
      $0.top.equalTo(self.titleLabel.snp.bottom).offset(20)
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.height.equalTo(164)
    }
  }
}

// MARK: - UICollectionViewDelegate

extension QuickOrderCell: UICollectionViewDelegate {
  
}

// MARK: - UICollectionViewDataSource

extension QuickOrderCell: UICollectionViewDataSource {
  
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
      return QuickOrderItem.dummyData.count
  }

  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: QuickOrderItemCell.identifier,
      for: indexPath
    ) as? QuickOrderItemCell else {
      return UICollectionViewCell()
    }
    cell.configure(with: QuickOrderItem.dummyData[indexPath.row])
    return cell
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    return CGSize(width: 255, height: 144)
  }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension QuickOrderCell: UICollectionViewDelegateFlowLayout {
  
}
