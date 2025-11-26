//
//  MyMenuListService.swift
//  STARBUCKS_iOS
//
//  Created by 이서현 on 11/26/25.
//

import Foundation

import Moya
import UIKit

final class MyMenuListService {
    private let provider = MoyaProvider<MyMenuListAPI>(plugins: [MoyaLoggerPlugin()])
    
    func fetchMyMenuList(completion: @escaping (NetworkResult<[MyMenuModel]>) -> Void) {
        provider.request(.getMyMenuList) { result in
            switch result {
            case .success(let response):
                do {
                    let decoded = try JSONDecoder().decode(MyMenuListResponseDTO.self, from: response.data)
                    let models = decoded.data.myMenuList.map { dto in
                        let category = MenuCategory(rawValue: dto.categoryName)
                        return MyMenuModel(
                            id: dto.myMenuId,
                            customName: dto.myMenuName,
                            officialName: dto.menuName,
                            detail: dto.myMenuOption,
                            price: "\(dto.price)",
                            imageName: dto.myMenuImage,
                            category: category ?? .all
                        )
                    }
                    completion(.success(models))
                } catch {
                    print("디코딩 에러: ", error)
                    completion(.pathErr)
                }
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
