//
//  DrinkDetailView.swift
//  STARBUCKS_iOS
//
//  Created by 진소은 on 11/17/25.
//

import UIKit

import SnapKit
import Then

final class DrinkDetailView: BaseView {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    var drinkInfoHeaderView = DrinkInfoHeaderView()
    var drinkInfoNoticeView = DrinkInfoNoticeView()
    
    // MARK: - Life Cycle
    
    // MARK: - Set UI
    override func setUI() {
        self.backgroundColor = .white
        self.addSubviews(drinkInfoHeaderView, drinkInfoNoticeView)
    }
    
    // MARK: - Set Layout
    
    override func setLayout() {
        drinkInfoHeaderView.snp.makeConstraints  {
            $0.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalTo(140)
        }
        
        drinkInfoNoticeView.snp.makeConstraints {
            $0.top.equalTo(drinkInfoHeaderView.snp.bottom)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
    }
    
    // MARK: - Private Methods
    
}
