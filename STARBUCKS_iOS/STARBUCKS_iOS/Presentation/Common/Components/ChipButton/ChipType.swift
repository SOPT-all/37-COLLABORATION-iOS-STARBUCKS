//
//  ChipType.swift
//  STARBUCKS_iOS
//
//  Created by 안치욱 on 11/19/25.
//

import UIKit

enum ChipType: CaseIterable {
    case green
    case coupon
    case pay
}

extension ChipType {
    var image: UIImage? {
        switch self {
        case .green: return .iconGreen
        case .coupon: return .iconCoupon
        case .pay: return .iconPay2
        }
    }
    
    var selected: Bool {
        switch self {
        case .green: return true
        case .coupon, .pay: return false
        }
    }
    
    
    
}
