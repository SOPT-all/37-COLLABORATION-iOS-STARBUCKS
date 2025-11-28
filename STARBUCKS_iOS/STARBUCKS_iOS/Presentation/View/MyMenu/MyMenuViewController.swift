//
//  MyMenuViewController.swift
//  STARBUCKS_iOS
//
//  Created by 이서현 on 11/19/25.
//

import UIKit

import SnapKit
import Then

protocol BackButtonAction: AnyObject {
    func refreshView()
}

final class MyMenuViewController: BaseViewController {
    
    weak var delegate: BackButtonAction?
    private let service = MyMenuListService()
    private var myMenuList: [MyMenuModel] = []
    private var filteredMenuList: [MyMenuModel] = []
    
    // MARK: - UI Components
    
    private let searchBar = NavigationBar(type: .search)
    private let filteringBarView = FilteringBarView()
    private let menuView = MyMenuListView()
    private let bottomView = MyMenuBottomView()
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        fetchMyMenuList()
        menuView.delegate = self

        filteringBarView.didChangeCategory = { [weak self] category in
            self?.applyFilter(category)
        }
        searchBar.leftButtonHandler = { [weak self] in
            self?.delegate?.refreshView()
            self?.navigationController?.popViewController(animated: true)
        }
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
    
    private func fetchMyMenuList() {
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
    }
    
    private func applyFilter(_ category: MenuCategory) {
        filteredMenuList = (category == .all) ?
        myMenuList : myMenuList.filter { $0.category == category }
        
        menuView.configure(items: filteredMenuList)
    }
}

extension MyMenuViewController: MyMenuListViewDelegate {
    func didTapAddMenu(_ menu: MyMenuModel) {
        guard menu.id == 1 else { return }
        
        let vc = DrinkDetailViewController()
        vc.delegate = self
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MyMenuViewController: SaveMenuDelegate {
    func updateView() {
        fetchMyMenuList()
    }
}
