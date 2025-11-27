//
//  TabBarController.swift
//  STARBUCKS_iOS
//
//  Created by 안치욱 on 11/17/25.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    private func configureTabBar() {
        let controllers = MainTab.allCases.map { tab in
            let vc = tab.viewController
            vc.tabBarItem = UITabBarItem(
                title: tab.title,
                image: tab.icon,
                selectedImage: tab.icon
            )
            vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.pretendard(.caption_r_10)], for: .normal)
            return vc
        }
        
        viewControllers = controllers
        tabBar.tintColor = .starbucksGreen500
        tabBar.unselectedItemTintColor = .starbucksGray500
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = .starbucksGray100
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
    }
}
