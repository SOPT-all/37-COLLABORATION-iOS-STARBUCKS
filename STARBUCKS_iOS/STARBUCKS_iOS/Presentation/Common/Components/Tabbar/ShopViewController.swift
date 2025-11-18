//
//  ShopViewController.swift
//  STARBUCKS_iOS
//
//  Created by 안치욱 on 11/17/25.
//

import UIKit

import SnapKit
import Then

final class ShopViewController: BaseViewController {
    
    private let shopView = UIView()
    
    override func setUI() {
        shopView.do {
            $0.backgroundColor = .systemGreen
        }
        
        view.addSubview(shopView)
    }
    
    override func setLayout() {
        shopView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
