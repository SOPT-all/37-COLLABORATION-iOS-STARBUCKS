//
//  HomeViewController.swift
//  STARBUCKS_iOS
//
//  Created by 안치욱 on 11/17/25.
//

import UIKit

import SnapKit
import Then

final class HomeViewController: BaseViewController {
    
    private var headerHeight: CGFloat = 237
    private var offsetCorrection: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupTableHeader()
    }
    // MARK: - Properties
    
    private let homeView = HomeView()
    
    // MARK: - UI Components
    
    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = homeView
    }
    
    // MARK: - Private Methods
    
    private func setupTableView() {
        homeView.mainTableView.delegate = self
        homeView.mainTableView.dataSource = self
        homeView.mainTableView.separatorStyle = .none
        homeView.mainTableView.rowHeight = UITableView.automaticDimension
        homeView.mainTableView.estimatedRowHeight = 300
        homeView.mainTableView.register(QuickOrderCell.self, forCellReuseIdentifier: QuickOrderCell.identifier)
        homeView.mainTableView.register(RecommendMenuCell.self, forCellReuseIdentifier: RecommendMenuCell.identifier)
        homeView.mainTableView.register(WhatsNewCell.self, forCellReuseIdentifier:
            WhatsNewCell.identifier)
        homeView.mainTableView.register(PromotionCell.self, forCellReuseIdentifier:
            PromotionCell.identifier)
    }
    
    private func setupTableHeader() {
        let header = homeView.headerContainer

        header.frame = CGRect(
            x: 0,
            y: 0,
            width: view.frame.width,
            height: headerHeight
        )

        homeView.mainTableView.tableHeaderView = header
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y

        if y > 0 {
            let newHeight = max(headerHeight - y, 0)
            updateHeaderHeight(newHeight)
            homeView.titleLabel.alpha = newHeight / headerHeight
        }
    }
    
    private func updateHeaderHeight(_ height: CGFloat) {
        guard let header = homeView.mainTableView.tableHeaderView else { return }

        var frame = header.frame
        frame.size.height = height
        header.frame = frame

        homeView.mainTableView.tableHeaderView = header
    }
    
}

extension HomeViewController: UITableViewDelegate {
    
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

extension HomeViewController: UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = MainTableViewSection(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        switch section {
        case .quickOrder:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: QuickOrderCell.identifier) as? QuickOrderCell else {
                return UITableViewCell()
            }
            return cell
        case .recommendMenu:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RecommendMenuCell.identifier) as? RecommendMenuCell else {
                return UITableViewCell()
            }
            return cell
        case .promotion:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PromotionCell.identifier) as? PromotionCell else {
                return UITableViewCell()
            }
            return cell
        case .onlineStore:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: OnlineStoreCell.identifier) as? OnlineStoreCell else {
                return UITableViewCell()
            }
            return cell
        case .whatsNew:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WhatsNewCell.identifier) as? WhatsNewCell else {
                return UITableViewCell()
            }
            return cell
        }
    }
}

#Preview {
    HomeViewController()
}
