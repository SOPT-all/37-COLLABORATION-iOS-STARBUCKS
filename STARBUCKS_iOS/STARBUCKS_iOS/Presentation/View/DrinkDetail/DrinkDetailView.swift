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
    
    var drinkInfoView = DrinkInfoHeaderView()
    
    // MARK: - Life Cycle
    
    // MARK: - Set UI
    override func setUI() {
        self.backgroundColor = .white
        self.addSubviews(drinkInfoView)
    }
    
    // MARK: - Set Layout
    
    override func setLayout() {
        drinkInfoView.snp.makeConstraints  {
            $0.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    // MARK: - Private Methods
    
}
