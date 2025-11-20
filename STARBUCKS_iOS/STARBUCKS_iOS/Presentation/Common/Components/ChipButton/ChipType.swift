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
    case buddyPass
}

extension ChipType {
    var image: UIImage? {
        switch self {
        case .green: return .iconGreen
        case .coupon: return .iconCoupon
        case .pay: return .iconPay2
        case .buddyPass: return .iconBuddypass
        }
    }
    
    var selected: Bool {
        switch self {
        case .green, .buddyPass: return true
        case .coupon, .pay: return false
        }
    }
    
    var title: String {
        switch self {
        case .green: return "Green"
        case .coupon: return "Coupon"
        case .pay: return "Pay"
        case .buddyPass: return "Buddy Pass"
        }
    }
    
    var leadingInset: CGFloat {
        switch self {
        case .green: return 22
        case .coupon: return 22
        case .pay: return 14
        case .buddyPass: return 12
        }
    }
    
    var secondInset: CGFloat {
        10
    }
    
    var width: CGFloat {
        switch self {
        case .green: return 123
        case .coupon: return 122
        case .pay: return 84
        case .buddyPass: return 135
        }
    }
}
