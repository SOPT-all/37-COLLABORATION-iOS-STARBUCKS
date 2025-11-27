//
//  HomeView.swift
//  STARBUCKS_iOS
//
//  Created by JIN on 11/17/25.
//

import UIKit

import SnapKit
import Then

final class HomeView: BaseView {
    
    // MARK: - Properties
    
    let mainTableView = UITableView(frame: .zero, style: .plain)
    
    // MARK: - UI Components
    let whiteOverlayView = UIView()
    let headerContainer = UIView()
    let headerImage = UIImageView()
    let titleLabel = UILabel()

    private let chipCollectionViewLayout = UICollectionViewFlowLayout()

    private lazy var chipCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: chipCollectionViewLayout
    )
    
    // MARK: - Life Cycle
    
    // MARK: - Set UI
    override func setUI() {
        backgroundColor = .white
        self.addSubviews(mainTableView, headerContainer, chipCollectionView)
        headerContainer.addSubviews(headerImage, titleLabel, whiteOverlayView)
        mainTableView.do {
            $0.backgroundColor = .white
        }
        
        headerImage.do {
            $0.image = UIImage(resource: .imageHomeTopBanner)
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
        titleLabel.do {
            $0.text = "미국에서 온 케이크 팝과\n사탕 같은 시간을 보내요"
            $0.numberOfLines = 2
            $0.font = .pretendard(.head_b_21)
            $0.textColor = .black
        }

        whiteOverlayView.do {
            $0.backgroundColor = .white
            $0.alpha = 0
        }

        chipCollectionViewLayout.do {
            $0.scrollDirection = .horizontal
            $0.minimumInteritemSpacing = 8
            $0.minimumLineSpacing = 8
            $0.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        }

        chipCollectionView.do {
            $0.backgroundColor = .clear
            $0.showsHorizontalScrollIndicator = false
            $0.allowsSelection = false
            $0.delegate = self
            $0.dataSource = self
            $0.register(ChipCell.self, forCellWithReuseIdentifier: ChipCell.identifier)
        }
    }
    
    // MARK: - Set Layout
    
    override func setLayout() {
        mainTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        headerContainer.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(237)
        }

        chipCollectionView.snp.makeConstraints {
            $0.bottom.equalTo(headerContainer.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(60)
        }

        headerImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(headerImage)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }

        whiteOverlayView.snp.makeConstraints {
            $0.edges.equalTo(headerImage)
        }
    }

    // MARK: - Methods

    func updateHeaderContainerYPosition(_ y: CGFloat) {
        headerContainer.snp.updateConstraints {
            $0.top.equalToSuperview().offset(y)
        }
    }

    func updateChipCollectionYPosition(_ additionalOffset: CGFloat) {
        chipCollectionView.snp.updateConstraints {
            $0.bottom.equalTo(headerContainer.snp.bottom).offset(additionalOffset)
        }
    }
}

// MARK: - UICollectionViewDataSource

extension HomeView: UICollectionViewDataSource {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return ChipType.allCases.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ChipCell.identifier,
            for: indexPath
        ) as? ChipCell else {
            return UICollectionViewCell()
        }

        let chipType = ChipType.allCases[indexPath.row]
        cell.configure(with: chipType)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeView: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let chipType = ChipType.allCases[indexPath.row]
        return CGSize(width: chipType.width, height: 41)
    }
}
