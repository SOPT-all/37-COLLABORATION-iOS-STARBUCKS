//
//  WhatsNewCell.swift
//  STARBUCKS_iOS
//
//  Created by JIN on 11/18/25.
//

import UIKit

import SnapKit
import Then

// MARK: - WhatsNewItem

struct WhatsNewItem {
    let image: UIImage?
    let title: String
    let description: String
    
    static let dummyData: [WhatsNewItem] = [
      WhatsNewItem(
        image: UIImage(),
        title: "각인 뉴턴 캔디 핑크 텀블러 355...",
        description: "러블리한 핑크빛 각인 텀블러를 쏙데이 헤택과 함께 만나보세요!"
      ),
      WhatsNewItem(
        image: UIImage(),
        title: "2025 WINTER e-F...",
        description: "스타벅스 삼성카드로 2025 WINTER e-FREQUENCY 참여시 별★..."
      ),
      WhatsNewItem(
        image: UIImage(),
        title: "새로운 소식 3",
        description: "세 번째 소식입니다"
      )
    ]}

// MARK: - WhatsNewCell

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

// MARK: - WhatsNewItemCell

final class WhatsNewItemCell: UICollectionViewCell {
    
    // MARK: - UI Components
    
    private let cardImageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        contentView.backgroundColor = .white
        contentView.clipsToBounds = true
        
        cardImageView.do {
          
              $0.contentMode = .scaleAspectFill
              $0.clipsToBounds = true
              $0.backgroundColor = .starbucksGray200
              $0.layer.cornerRadius = 12
            
    }
        
        titleLabel.do {
            $0.font = .pretendard(.head_m_16)
            $0.textColor = .black
        }
        
        descriptionLabel.do {
            $0.font = .pretendard(.caption_r_12)
            $0.textColor = .starbucksGray600
            $0.numberOfLines = 2
        }
        
        contentView.addSubviews(
            cardImageView,
            titleLabel,
            descriptionLabel
        )
    }
    
    private func setupLayout() {
        cardImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(150)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(cardImageView.snp.bottom).offset(11)
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().offset(-12)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().offset(-12)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    // MARK: - Configuration
    
    func configure(with item: WhatsNewItem) {
        cardImageView.image = item.image
        titleLabel.text = item.title
        descriptionLabel.text = item.description
    }
}

