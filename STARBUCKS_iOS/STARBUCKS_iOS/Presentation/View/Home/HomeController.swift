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
        rootView.tableView.delegate = self
        rootView.dataSource = self
        rootView.separatorStyle = .none
        rootView.contentInsetAdjustmentBehavior = .never
    }
    
    // MARK: - Public Methods
    
    // MARK: - Set Actions
}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
