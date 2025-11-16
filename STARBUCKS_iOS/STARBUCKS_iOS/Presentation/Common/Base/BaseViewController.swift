//
//  BaseViewController.swift
//  STARBUCKS_iOS
//
//  Created by 진소은 on 11/17/25.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    // MARK: - Override
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - Setup Methods
    
    func setUI() {}
    func setLayout() {}
}
