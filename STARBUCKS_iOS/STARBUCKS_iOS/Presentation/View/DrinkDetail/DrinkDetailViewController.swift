//
//  DrinkDetailViewController.swift
//  STARBUCKS_iOS
//
//  Created by 진소은 on 11/17/25.
//

import UIKit

import SnapKit
import Then

final class DrinkDetailViewController: BaseViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    let drinkDetailView = DrinkDetailView()
    
    // MARK: - Life Cycle
    
    // MARK: - Set UI
    
    override func setUI() {
        view.addSubview(drinkDetailView)
        
        drinkDetailView.drinkInfoHeaderView.setInfo(
            name: "아이스 핑크 팝 캐모마일 릴렉서",
            engName: "Iced Pink Pop Chamomile Relaxer",
            detail: "크리스마스에 어울리는 샴페인 한잔과 같은 캐모마일 릴렉서! 리치, 레몬그라스, 캐모마일의 차분하면서도 새콤달콤한 조합 크리스마스 오너먼트가 떠오르는 핑크 리치 보바로 팝! 터지는 식감의 재미와 리치 풍미를 더했습니다")
    }
    
    // MARK: - Set Layout
    
    override func setLayout() {
        drinkDetailView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Private Methods
    
    // MARK: - Public Methods
    
    // MARK: - Set Actions
}
