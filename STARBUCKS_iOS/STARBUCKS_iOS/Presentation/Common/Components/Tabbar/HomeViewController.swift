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
    
    // HomeViewController.swift

    private var headerHeight: CGFloat = 237
    private var offsetCorrection: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupPanGesture()
    }

    private func setupPanGesture() {
        homeView.mainTableView.panGestureRecognizer.addTarget(
            self,
            action: #selector(handlePanGesture)
        )
    }

    @objc private func handlePanGesture(_ sender: UIPanGestureRecognizer) {
        let translationY = sender.translation(in: homeView.mainTableView).y
        let velocityY = sender.velocity(in: homeView.mainTableView).y
        let unclampedOffset = translationY - offsetCorrection
        if unclampedOffset >= 0 {
            offsetCorrection = translationY
        }
        if unclampedOffset <= -headerHeight {
            offsetCorrection = translationY + headerHeight
        }
        let headerOffsetY = translationY - offsetCorrection
        updateHeaderPosition(headerOffsetY)
        let progress = abs(headerOffsetY) / headerHeight
        homeView.titleLabel.alpha = 1 - progress
        
        if sender.state == .ended {
            UIView.animate(withDuration: 0.2) { [weak self] in
                guard let self = self else { return }
                
                if velocityY < 0 {
                    self.updateHeaderPosition(-self.headerHeight)
                    self.homeView.titleLabel.alpha = 0
                    self.offsetCorrection = self.headerHeight
                } else {
                    self.updateHeaderPosition(0)
                    self.homeView.titleLabel.alpha = 1
                    self.offsetCorrection = 0
                }
                
                self.homeView.layoutIfNeeded()
            }
        }
    }

    private func updateHeaderPosition(_ offsetY: CGFloat) {
        homeView.headerImage.snp.updateConstraints {
            $0.top.equalToSuperview().offset(offsetY)
        }
    }
    
    // MARK: - Properties
    
    private let homeView = HomeView()
    
    // MARK: - UI Components
    
    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = homeView
    }

    
    // MARK: - Set UI
    override func setUI() {
      
    }
    
    // MARK: - Set Layout
    
    override func setLayout() {

    }
    
    // MARK: - Private Methods
    
    private func setupTableView() {
        homeView.mainTableView.delegate = self
        homeView.mainTableView.dataSource = self
        homeView.mainTableView.separatorStyle = .none
        homeView.mainTableView.contentInsetAdjustmentBehavior = .never
        homeView.mainTableView.contentInset.top = 250
        homeView.mainTableView.register(QuickOrderCell.self, forCellReuseIdentifier: QuickOrderCell.identifier)
        homeView.mainTableView.register(RecommendMenuCell.self, forCellReuseIdentifier: RecommendMenuCell.identifier)
    }
    
    // MARK: - Public Methods
    
    
    // MARK: - Set Actions
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
