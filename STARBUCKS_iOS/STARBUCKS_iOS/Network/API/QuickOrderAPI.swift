//
//  QuickOrderAPI.swift
//  STARBUCKS_iOS
//
//  Created by JIN on 11/26/25.
//

import Foundation

import Moya

enum QuickOrderAPI {
    case getMyMenu
}

extension QuickOrderAPI: BaseTargetType {
    
    var path: String {
        switch self {
        case .getMyMenu:
            return "/api/v1/mymenu/home"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMyMenu:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getMyMenu:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
