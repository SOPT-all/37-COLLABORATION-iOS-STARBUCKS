//
//  OtherViewController.swift
//  STARBUCKS_iOS
//
//  Created by 안치욱 on 11/17/25.
//

import UIKit

import SnapKit
import Then

final class OtherViewController: BaseViewController {
    
    private let otherView = UIView().then {
        $0.backgroundColor = .systemBlue
    }
    
    override func setUI() {
        view.addSubview(otherView)
    }
    
    override func setLayout() {
        otherView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
