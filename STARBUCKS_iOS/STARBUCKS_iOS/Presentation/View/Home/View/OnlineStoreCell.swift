//
//  OnlineStoreCell.swift
//  STARBUCKS_iOS
//
//  Created by JIN on 11/18/25.
//

import UIKit

final class OnlineStoreCell: UITableViewCell {

    let titleLabel = UILabel()
    let storeImageView2 = UIImageView()
    let storeImageView = UIImageView()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        titleLabel.do {
            $0.text = "STARBUCKS ONLINE STORE"
            $0.font = .pretendard(.head_sb_18)
            $0.numberOfLines = 0
        }
        storeImageView.do {
            $0.image = .imageHomeBanner2
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
    }
    
    func setUI() {
        contentView.addSubviews(titleLabel, storeImageView, storeImageView2)
    }
    
    func setLayout() {
        
    }
}
