//
//  OrderViewController.swift
//  STARBUCKS_iOS
//
//  Created by 안치욱 on 11/17/25.
//

import UIKit

import SnapKit
import Then

final class OrderViewController: BaseViewController {
    
    private let orderView = UIView().then {
        $0.backgroundColor = .systemYellow
    }
    
    override func setUI() {
        view.addSubview(orderView)
    }
    
    override func setLayout() {
        orderView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
