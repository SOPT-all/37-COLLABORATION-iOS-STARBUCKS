//
//  DrinkDetailAPI.swift
//  STARBUCKS_iOS
//
//  Created by 진소은 on 11/24/25.
//

import Foundation

import Moya

enum DrinkDetailAPI {
    case getDrinkDetail(drinkId: Int)
}

extension DrinkDetailAPI: BaseTargetType {
    var path: String {
        switch self {
        case .getDrinkDetail(let drinkId):
            return "/api/v1/mymenu/\(drinkId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getDrinkDetail:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getDrinkDetail:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
