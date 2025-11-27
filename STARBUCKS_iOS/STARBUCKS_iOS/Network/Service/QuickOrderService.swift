//
//  QuickOrderService.swift
//  STARBUCKS_iOS
//
//  Created by JIN on 11/26/25.
//

import Foundation

import Moya

final class QuickOrderService {
    private let provider = MoyaProvider<QuickOrderAPI>(plugins: [MoyaLoggerPlugin()])
    
    func getMyMenuList(completion: @escaping (NetworkResult<MyMenuListDTO>) -> Void) {
        provider.request(.getMyMenu) { result in
            switch result {
            case .success(let response):
                do {
                    let decoded = try JSONDecoder().decode(MyMenuResponse.self, from: response.data)
                    completion(.success(decoded.data))
                } catch {
                    print("❌ Decoding error:", error)
                    completion(.pathErr)
                }
                
            case .failure(let error):
                print("❌ Network error:", error)
                completion(.networkFail)
            }
        }
    }
}
