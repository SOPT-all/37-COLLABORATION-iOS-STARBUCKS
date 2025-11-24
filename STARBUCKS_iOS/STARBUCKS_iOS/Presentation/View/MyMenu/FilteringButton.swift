//
//  FilteringButton.swift
//  STARBUCKS_iOS
//
//  Created by 이서현 on 11/20/25.
//

<<<<<<< Updated upstream
import Foundation
=======
import UIKit

import SnapKit
import Then

final class FilteringButton: UIButton {
  
  // MARK: - Properties
  
  private let menuCategory: MenuCategory
  
  var category: MenuCategory { menuCategory }
  
  // MARK: - UI Components
  
  private let menuCategoryView = UIView()
  private let filterNameLabel = UILabel()
  
  override var isSelected: Bool {
    didSet { updateUI()}
  }
  
  // MARK: - Life Cycle
  
  init(category: MenuCategory) {
    self.menuCategory = category
    super.init(frame: .zero)
    setUI()
    setLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  // MARK: - Set UI
  
  private func setUI() {
    self.backgroundColor = .clear
    
    menuCategoryView.do {
      $0.backgroundColor = .white
      $0.layer.cornerRadius = 13
      $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
      $0.layer.shadowOffset = .init(width: 0, height: 0)
      $0.layer.shadowOpacity = 1
      $0.layer.shadowRadius = 4
      $0.isUserInteractionEnabled = false
    }
    
    filterNameLabel.do {
      $0.text = menuCategory.title
      $0.font = UIFont.pretendard(.caption_r_14)
    }
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //버튼 눌리는지 확인용.. 네트워크 연결하면 지우기
    super.touchesBegan(touches, with: event)
    print("👉 touchesBegan in FilteringButton:", menuCategory.title)
  }
  
  // MARK: - Set Layout
  
  private func setLayout() {
    addSubviews(
      menuCategoryView,
      filterNameLabel
    )
    
    menuCategoryView.snp.makeConstraints {
        $0.edges.equalToSuperview()
        $0.height.equalTo(26)
    }

    filterNameLabel.snp.makeConstraints {
        $0.center.equalToSuperview()
    }
  }
  
  // MARK: - Private Methods

  private func updateUI() {
    if isSelected {
      print("updateUI")
      menuCategoryView.backgroundColor = .starbucksGray900 //색상확인
      filterNameLabel.textColor = .white
    } else {
      menuCategoryView.backgroundColor = .white
      filterNameLabel.textColor = .starbucksGray600
    }
  }
}
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
