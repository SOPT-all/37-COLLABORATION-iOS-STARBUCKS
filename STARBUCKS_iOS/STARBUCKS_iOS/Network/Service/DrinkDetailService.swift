//
//  DrinkDetailService.swift
//  STARBUCKS_iOS
//
//  Created by 진소은 on 11/24/25.
//

import Foundation

import Moya

final class DrinkDetailService {
    private let provider = MoyaProvider<DrinkDetailAPI>(plugins: [MoyaLoggerPlugin()])
    
    func fetchDrinkDetail(for drinkId: Int, completion: @escaping (NetworkResult<MyMenuDataDTO>) -> Void) {
        provider.request(.getDrinkDetail(drinkId: drinkId)) { result in
            switch result {
            case .success(let response):
                do {
                    let decoded = try JSONDecoder().decode(MyMenuResponseDTO.self, from: response.data)
                    completion(.success(decoded.data))
                } catch {
                    print("디코딩 에러:", error)
                    completion(.pathErr)
                }

            case .failure:
                completion(.networkFail)
            }
        }
    }
}
