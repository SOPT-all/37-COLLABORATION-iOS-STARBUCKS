//
//  HomeViewController.swift
//  STARBUCKS_iOS
//
//  Created by JIN on 11/17/25.
//


import UIKit

import SnapKit
import Then

  enum SectionType {
      case header
      case quickOrder
      case recommendations
      case campaign
      case onlineStore
      case whatsNew
  }

final class HomeController: BaseViewController {
    
    // MARK: - Properties
    
    private let rootView = HomeView()
    
    // MARK: - UI Components
    
    // MARK: - Life Cycle
    
    // MARK: - Set UI
    
    // MARK: - Set Layout
    
    // MARK: - Private Methods
    
    private func setupTableView() {
        rootView.mainTableView.delegate = self
        rootView.mainTableView.dataSource = self
        rootView.mainTableView.separatorStyle = .none
        rootView.mainTableView.contentInsetAdjustmentBehavior = .never
    }
    
    // MARK: - Public Methods
    
    // MARK: - Set Actions
}

extension HomeController: UITableViewDelegate {
    
    enum MainTableViewSection: Int, CaseIterable {
        case quickOrder
        case recommendMenu
        case promotion
        case onlineStore
        case whatsNew
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        MainTableViewSection.allCases.count
    }
}

extension HomeController: UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            case 0:
            
        }
    }
    
    
}
