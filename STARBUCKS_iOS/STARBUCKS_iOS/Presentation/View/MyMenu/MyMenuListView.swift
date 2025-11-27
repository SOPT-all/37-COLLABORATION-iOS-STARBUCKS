//
//  MyMenuListView.swift
//  STARBUCKS_iOS
//
//  Created by 이서현 on 11/20/25.
//

import UIKit

import SnapKit
import Then

protocol MyMenuListViewDelegate: AnyObject {
    func didTapAddMenu(_ menu: MyMenuModel)
}

final class MyMenuListView: BaseView {
    
    private let lineSpacing: CGFloat = 10
    private let cellHeight: CGFloat = 200
    weak var delegate: MyMenuListViewDelegate?
    private lazy var layout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: layout
    )
    
    var items: [MyMenuModel] = [] {
        didSet { collectionView.reloadData() }
    }
    
    //MARK: - setUI
    
    override func setUI() {
        addSubview(collectionView)
        
        collectionView.do {
            $0.backgroundColor = .clear
            $0.showsVerticalScrollIndicator = false
            $0.dataSource = self
            $0.delegate = self
            $0.register(
                MyMenuCollectionViewCell.self,
                forCellWithReuseIdentifier: MyMenuCollectionViewCell.identifier
            )
        }
        
        layout.do {
            $0.scrollDirection = .vertical
            $0.minimumLineSpacing = lineSpacing
        }
    }
    
    //MARK: - setLayout
    
    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    //MARK: - method
    
    func configure(items: [MyMenuModel]) {
        self.items = items
    }
}

//MARK: - extensions

extension MyMenuListView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, MyMenuCollectionViewCellDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int { items.count }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MyMenuCollectionViewCell.identifier,
            for: indexPath
        ) as! MyMenuCollectionViewCell
        
        let item = items[indexPath.item]
        cell.configure(with: item)
        cell.delegate = self
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menu = items[indexPath.item]
        delegate?.didTapAddMenu(menu)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = collectionView.frame.width
        let height = cellHeight
        
        return CGSize(
            width: width,
            height: height
        )
    }
    
    // MARK: - MyMenuCollectionViewCellDelegate
    
    func didTapaddMenuButton(in cell: MyMenuCollectionViewCell) {
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        let menu = items[indexPath.item]
        delegate?.didTapAddMenu(menu)
    }
}
