//
//  MenuCategory.swift
//  STARBUCKS_iOS
//
//  Created by 이서현 on 11/20/25.
//

import UIKit

import SnapKit
import Then

enum MenuCategory: CaseIterable {
  case all
  case drink
  case food
}

extension MenuCategory {
  var title: String {
    switch self {
    case .all: return "ALL"
    case .drink: return "음료"
    case .food: return "푸드"
    }
  }
  
  var edgeInset: CGFloat {
    10
  }
  
  var width: CGFloat {
    switch self {
    case .all: return 55
    case .drink: return 67
    case .food: return 72
    }
  }
}
