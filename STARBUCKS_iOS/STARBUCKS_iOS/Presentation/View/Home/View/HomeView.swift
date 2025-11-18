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
    
    let headerImage = UIImageView()
    let titleLabel = UILabel()
    
    // MARK: - Life Cycle
    
    // MARK: - setUIComponent
    
    func setUIComponent() {
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
    }
    
    // MARK: - Set UI
    override func setUI() {
        setUIComponent()
        self.addSubviews(mainTableView, headerImage, titleLabel)
         
    }
    
    // MARK: - Set Layout
    
    override func setLayout() {
        headerImage.snp.makeConstraints {
            $0.top.equalToSuperview() 
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(375)
            $0.height.equalTo(237)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(headerImage)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        mainTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    // MARK: - Private Methods
    
}
