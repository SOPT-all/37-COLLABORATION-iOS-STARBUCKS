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
    
    //MARK: - Properties
    
    private var myMenuList: [MyMenuDTO] = []
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let collectionViewLayout = UICollectionViewFlowLayout()
    let myMenuButton = MenuButton()

    private lazy var mainCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: collectionViewLayout
    )
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setUI
    
    private func setUI() {
        backgroundColor = .white
        titleLabel.do {
            $0.text = "Quick Order"
            $0.font = .pretendard(.head_b_20)
            $0.textColor = .black
        }
        
        collectionViewLayout.do {
            $0.scrollDirection = .horizontal
            $0.minimumInteritemSpacing = 16
            $0.minimumLineSpacing = 16
            $0.sectionInset = .init(top: 10, left: 20, bottom: 10, right: 20)
        }
        
        mainCollectionView.do {
            $0.backgroundColor = .white
            $0.showsHorizontalScrollIndicator = false
            $0.allowsSelection = false
            $0.delegate = self
            $0.dataSource = self
            $0.register(
                QuickOrderItemCell.self,
                forCellWithReuseIdentifier: QuickOrderItemCell.identifier
            )
            $0.register(FinalCardCell.self,
                forCellWithReuseIdentifier: FinalCardCell.identifier)
        }
        
        contentView.addSubviews(titleLabel,
                                myMenuButton,
                                mainCollectionView)
    }
    
    // MARK: - Layout
    
    private func setLayout() {
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        
        myMenuButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)  
            $0.trailing.equalToSuperview().inset(20)
        }
        
        mainCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(164)
        }
    }
    
    func configure(menuList: [MyMenuDTO]) {
        self.myMenuList = menuList
        mainCollectionView.reloadData()
    }
}


// MARK: - UICollectionViewDataSource

extension QuickOrderCell: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return myMenuList.count + 1
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        if indexPath.item == myMenuList.count {
           guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FinalCardCell.identifier, for: indexPath) as? FinalCardCell else {
                return UICollectionViewCell()
            }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuickOrderItemCell.identifier, for: indexPath) as? QuickOrderItemCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: myMenuList[indexPath.row])
            return cell
        }
     
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension QuickOrderCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: 255, height: 144)
    }
}
