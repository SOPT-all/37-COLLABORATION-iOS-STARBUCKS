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
    
    private let service = MyMenuListService()
    private var myMenuList: [MyMenuModel] = []
    private var filteredMenuList: [MyMenuModel] = []
    
    // MARK: - UI Components
    
    private let searchBar = NavigationBar(type: .search)
    private let filteringBarView = FilteringBarView()
    private let menuView = MyMenuListView()
    private let bottomView = MyMenuBottomView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        service.fetchMyMenuList { result in
            switch result {
            case .success(let data):
                self.myMenuList = data
                self.filteredMenuList = data
                self.menuView.configure(items: data)
            case .requestErr(let message):
                print("요청 에러:", message)
                
            case .pathErr:
                print("경로 에러")
                
            case .serverErr:
                print("서버 에러")
                
            case .networkFail:
                print("네트워크 에러")
                
            }
        }
        
        menuView.delegate = self
        
        filteringBarView.didChangeCategory = { [weak self] category in
            self?.applyFilter(category)
            
            // 여기서 category 에 따라 서버/로컬 데이터 필터링
            // ex) self.filterMenus(by: category)
        }
        
        popToHomeViewController()
    }
    
    // MARK: - Set UI
    
    override func setUI() {
        super.setUI()
        view.addSubviews(searchBar, filteringBarView, menuView, bottomView)
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
    
    private func applyFilter(_ category: MenuCategory) {
        switch category {
        case .all:
            filteredMenuList = myMenuList
        case .drink:
            filteredMenuList = myMenuList.filter { $0.category == .drink }
        case .food:
            filteredMenuList = myMenuList.filter { $0.category == .food }
        }
        
        menuView.configure(items: filteredMenuList)
    }
    
    private func popToHomeViewController() {
        searchBar.leftButtonHandler = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
}

extension MyMenuViewController: MyMenuListViewDelegate {
    func didTapAddMenu(_ menu: MyMenuModel) {
        guard menu.id == 1 else { return }
        
        let vc = DrinkDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
