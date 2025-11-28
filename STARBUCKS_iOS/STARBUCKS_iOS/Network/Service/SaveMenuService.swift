//
//  SaveMenuService.swift
//  STARBUCKS_iOS
//
//  Created by 안치욱 on 11/28/25.
//

import Foundation

import Moya

final class SaveMenuService {
    private let provider = MoyaProvider<SaveMenuAPI>(plugins: [MoyaLoggerPlugin()])
    
    func saveMenu(drinkId: Int, body: SaveMenuDataDTO, completion: @escaping (NetworkResult<SaveMenuResponseDTO>) -> Void) {
        provider.request(.patchMyMenu(drinkId: drinkId, body: body)) { result in
            switch result {
            case .success(let response):
                do {
                    let decoded = try JSONDecoder().decode(SaveMenuResponseDTO.self, from: response.data)
                    completion(.success(decoded))
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
