//
//  PromotionCell.swift
//  STARBUCKS_iOS
//
//  Created by JIN on 11/18/25.
//

import UIKit

final class PromotionCell: UITableViewCell {

  let promotionImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentView.addSubview(promotionImage)
        
        promotionImage.do {
            $0.image = UIImage(resource: .imageHomePromotion2)
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
        }
    }
    
    private func setLayout() {
        promotionImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.equalTo(331)
            $0.height.equalTo(394)
            $0.bottom.equalToSuperview()
        }
    }
}
