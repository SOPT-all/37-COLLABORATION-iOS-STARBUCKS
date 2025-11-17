//
//  MainTab.swift
//  STARBUCKS_iOS
//
//  Created by 안치욱 on 11/17/25.
//

import UIKit


enum MainTab: CaseIterable {
    case home
    case pay
    case order
    case shop
    case other
}

extension MainTab {
    var title: String {
        switch self {
        case .home: return "Home"
        case .pay: return "Pay"
        case .order: return "Order"
        case .shop: return "Shop"
        case .other: return "Other"
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .home: return .iconHome
        case .pay: return .iconPay1
        case .order: return .iconOrder
        case .shop: return .iconShop
        case .other: return .iconOther
        }
    }
    
    var viewController: UIViewController {
        switch self {
        case .home: return HomeViewController()
        case .pay: return PayViewController()
        case .order: return OrderViewController()
        case .shop: return ShopViewController()
        case .other: return OtherViewController()
        }
    }
}
