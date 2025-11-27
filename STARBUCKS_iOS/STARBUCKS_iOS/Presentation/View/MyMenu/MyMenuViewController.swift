//
//  MyMenuViewController.swift
//  STARBUCKS_iOS
//
//  Created by 이서현 on 11/19/25.
//

import UIKit

import SnapKit
import Then

final class MyMenuViewController: BaseViewController {
    
    // MARK: - UI Components
    
    private let searchBar = NavigationBar(type: .search)
    private let filteringBarView = FilteringBarView()
    private let menuView = MyMenuListView()
    private let bottomView = MyMenuBottomView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        menuView.delegate = self
        
        //fixme!!
        filteringBarView.didChangeCategory = { [weak self] category in
            guard let self else { return }
            // 여기서 category 에 따라 서버/로컬 데이터 필터링
            // ex) self.filterMenus(by: category)
        }
    }
    
    // MARK: - Set UI
    
    override func setUI() {
        super.setUI()
        view.addSubviews(searchBar, filteringBarView, menuView, bottomView)
        menuView.configure(items: MyMenuModel.mock)
    }
    
    // MARK: - Set Layout
    
    override func setLayout() {
        searchBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(24)
        }
        filteringBarView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(13)
            $0.leading.equalTo(searchBar).offset(16)
            $0.trailing.equalToSuperview().inset(145)
        }
        menuView.snp.makeConstraints {
            $0.top.equalTo(filteringBarView.snp.bottom).offset(13)
            $0.bottom.equalTo(bottomView.snp.top)
            $0.horizontalEdges.equalToSuperview()
        }
        bottomView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.height.equalTo(56)
        }
    }
}

extension MyMenuViewController: MyMenuListViewDelegate {
    func didSelectMenu(_ menu: MyMenuModel) {
        print("선택된 메뉴: \(menu.customName)")
        //FIXME: - 리프레셔(id = 1)만 다음 화면 넘어가게 활성화하는 코드
    }
}
