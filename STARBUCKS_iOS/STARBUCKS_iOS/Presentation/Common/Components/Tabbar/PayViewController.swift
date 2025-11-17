//
//  PayViewController.swift
//  STARBUCKS_iOS
//
//  Created by 안치욱 on 11/17/25.
//

import UIKit

import SnapKit
import Then

final class PayViewController: BaseViewController {
    
    private let payView = UIView().then {
        $0.backgroundColor = .systemOrange
    }
    
    override func setUI() {
        view.addSubview(payView)
    }
    
    override func setLayout() {
        payView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
