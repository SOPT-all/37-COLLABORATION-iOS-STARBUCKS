//
//  SaveMenuAPI.swift
//  STARBUCKS_iOS
//
//  Created by 안치욱 on 11/28/25.
//

import Foundation

import Moya

enum SaveMenuAPI {
    case patchMyMenu(drinkId: Int, body: SaveMenuDataDTO)
}

extension SaveMenuAPI: BaseTargetType {
    var path: String {
        switch self {
        case .patchMyMenu(let drinkId, _):
            return "/api/v1/mymenu/\(drinkId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .patchMyMenu:
            return .patch
        }
    }
    
    var task: Task {
        switch self {
        case .patchMyMenu(_, let body):
            return .requestJSONEncodable(body)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
