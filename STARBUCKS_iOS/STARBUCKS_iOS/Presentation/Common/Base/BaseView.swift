//
//  BaseView.swift
//  STARBUCKS_iOS
//
//  Created by 진소은 on 11/17/25.
//

import UIKit

class BaseView: UIView {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    
    func setUI() {}
    func setLayout() {}
}
