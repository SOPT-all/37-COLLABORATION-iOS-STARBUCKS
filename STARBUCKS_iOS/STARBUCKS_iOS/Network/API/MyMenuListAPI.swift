//
//  MyMenuListAPI.swift
//  STARBUCKS_iOS
//
//  Created by 이서현 on 11/26/25.
//

import Foundation

import Moya

enum MyMenuListAPI {
    case getMyMenuList
}

extension MyMenuListAPI: BaseTargetType {
    var path: String {
        switch self {
        case .getMyMenuList:
            return "/api/v1/mymenu/list"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMyMenuList:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getMyMenuList:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
