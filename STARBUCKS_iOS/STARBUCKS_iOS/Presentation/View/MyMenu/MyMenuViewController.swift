//
//  MyMenuViewController.swift
//  STARBUCKS_iOS
//
//  Created by 이서현 on 11/19/25.
//

import UIKit

import SnapKit
import Then

final class MyMenuViewController: BaseViewController {

    // MARK: - UI Components
    
    private let menuView = MyMenuListView()
    
    // MARK: - Life Cycle
    
  override func loadView() {
      view = menuView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUI()
    setLayout()
    
    menuView.delegate = self
  }
    // MARK: - Set UI
    
  override func setUI() {
    menuView.configure(items: MyMenuModel.mock)
  }
    // MARK: - Set Layout
    
    // MARK: - Private Methods
    
    // MARK: - Public Methods
    
    // MARK: - Set Actions
}

extension MyMenuViewController: MyMenuListViewDelegate {
  func didSelectMenu(_ menu: MyMenuModel) {
    print("선택된 메뉴: \(menu.customName)")
    //FIXME: - 리프레셔(id = 1)만 다음 화면 넘어가게 활성화하는 코드
  }
  
  
}
