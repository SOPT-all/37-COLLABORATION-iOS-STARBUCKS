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

    // MARK: - Properties

    private let homeView = HomeView()
    private var offsetCorrection: CGFloat = 0

    // MARK: - Enum

    private enum ScrollDirection {
        case up
        case down

        init?(velocity: CGFloat) {
            if velocity > 0 {
                self = .up
            } else {
                self = .down
            }
        }
    }

    // MARK: - Life Cycle

    override func loadView() {
        self.view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    // MARK: - Private Methods

    private func setupTableView() {
        homeView.mainTableView.delegate = self
        homeView.mainTableView.dataSource = self
        homeView.mainTableView.separatorStyle = .none
        homeView.mainTableView.rowHeight = UITableView.automaticDimension
        homeView.mainTableView.estimatedRowHeight = 300
        homeView.mainTableView.register(
            QuickOrderCell.self,
            forCellReuseIdentifier: QuickOrderCell.identifier
        )
        homeView.mainTableView.register(
            RecommendMenuCell.self,
            forCellReuseIdentifier: RecommendMenuCell.identifier
        )
        homeView.mainTableView.register(
            WhatsNewCell.self,
            forCellReuseIdentifier: WhatsNewCell.identifier
        )
        homeView.mainTableView.register(
            PromotionCell.self,
            forCellReuseIdentifier: PromotionCell.identifier
        )

        homeView.mainTableView.panGestureRecognizer.addTarget(self, action: #selector(panGesture))

        homeView.layoutIfNeeded()
        homeView.mainTableView.contentInset.top = homeView.headerContainer.bounds.height - 40
        homeView.mainTableView.contentOffset.y = -homeView.mainTableView.contentInset.top
    }

    @objc func panGesture(_ sender: UIPanGestureRecognizer) {
        let translationY = sender.translation(in: homeView.mainTableView).y
        let velocityY = sender.velocity(in: homeView.mainTableView).y

        let headerStickyHeight = homeView.headerContainer.bounds.height * 0.55
        let unclampedOffset = translationY - offsetCorrection

        if unclampedOffset >= 0 {
            offsetCorrection = translationY
        }
        if unclampedOffset <= -headerStickyHeight {
            offsetCorrection = translationY + headerStickyHeight
        }

        let headerContainerOffsetY = translationY - offsetCorrection
        homeView.updateHeaderContainerYPosition(headerContainerOffsetY)

        let progress = min(max(-headerContainerOffsetY / headerStickyHeight, 0), 1)
        homeView.whiteOverlayView.alpha = progress

        if -headerContainerOffsetY >= headerStickyHeight {
            homeView.updateChipCollectionYPosition(25)
        } else {
            let chipAdditionalOffset = (-headerContainerOffsetY / headerStickyHeight) * 25
            homeView.updateChipCollectionYPosition(chipAdditionalOffset)
        }

        if sender.state == .ended {
            UIView.animate(withDuration: 0.2, animations: { [weak self] in
                guard let self else { return }
                switch ScrollDirection(velocity: velocityY) {
                case .up:
                    homeView.updateHeaderContainerYPosition(0)
                    homeView.updateChipCollectionYPosition(0)
                    offsetCorrection = 0
                    homeView.whiteOverlayView.alpha = 0
                case .down:
                    homeView.updateHeaderContainerYPosition(-headerStickyHeight)
                    homeView.updateChipCollectionYPosition(25)
                    offsetCorrection = headerStickyHeight
                    homeView.whiteOverlayView.alpha = 1
                case nil:
                    break
                }
                homeView.layoutIfNeeded()
            })
        }
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {

    enum MainTableViewSection: Int, CaseIterable {
        case quickOrder
        case recommendMenu
        case promotion
        case onlineStore
        case whatsNew
        
        var cellType: UITableViewCell.Type {
            switch self {
            case .quickOrder:    return QuickOrderCell.self
            case .recommendMenu: return RecommendMenuCell.self
            case .promotion:     return PromotionCell.self
            case .onlineStore:   return OnlineStoreCell.self
            case .whatsNew:      return WhatsNewCell.self
            }
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return MainTableViewSection.allCases.count
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = MainTableViewSection(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        let identifier = section.cellType.identifier
        
        return tableView.dequeueReusableCell(withIdentifier: identifier) ?? UITableViewCell()
    }
}
