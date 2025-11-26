//
//  MenuCategory.swift
//  STARBUCKS_iOS
//
//  Created by 이서현 on 11/20/25.
//

import UIKit

import SnapKit
import Then

enum MenuCategory: String, CaseIterable {
    case all = "ALL"
    case drink = "DRINK"
    case food = "FOOD"
}

extension MenuCategory {
    var title: String {
        switch self {
        case .all: return "All"
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
