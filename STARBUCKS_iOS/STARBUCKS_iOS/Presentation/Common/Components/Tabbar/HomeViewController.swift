//
//  HomeViewController.swift
//  STARBUCKS_iOS
//
//  Created by 안치욱 on 11/17/25.
//

import UIKit

import SnapKit
import Then

final class HomeViewController: BaseViewController {
    
    private let homeView = UIView()
    
    override func setUI() {
        homeView.do {
            $0.backgroundColor = .systemRed
        }
        
        view.addSubview(homeView)
    }
    
    override func setLayout() {
        homeView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
