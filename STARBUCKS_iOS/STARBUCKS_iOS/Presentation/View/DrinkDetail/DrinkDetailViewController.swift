//
//  DrinkDetailViewController.swift
//  STARBUCKS_iOS
//
//  Created by 진소은 on 11/17/25.
//

import UIKit

import Moya
import SnapKit
import Then

final class DrinkDetailViewController: UIViewController {

    private let service = DrinkDetailService()

    override func viewDidLoad() {
        super.viewDidLoad()

        // 예시로 drinkId = 1
        service.fetchDrinkDetail(for: 1) { result in
            switch result {
            case .success(let dto):
                print("받은 데이터:")
                print(dto)

            case .requestErr(let message):
                print("요청 에러:", message)

            case .pathErr:
                print("경로(path) 에러")

            case .serverErr:
                print("서버 에러")

            case .networkFail:
                print("네트워크 실패")
            }
        }
    }
}

