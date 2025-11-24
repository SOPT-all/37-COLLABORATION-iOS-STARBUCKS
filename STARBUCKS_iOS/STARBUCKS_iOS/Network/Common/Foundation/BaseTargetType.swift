//
//  BaseTargetType.swift
//  STARBUCKS_iOS
//
//  Created by 진소은 on 11/24/25.
//

import Foundation

import Moya

protocol BaseTargetType: TargetType { }

extension BaseTargetType{

    var baseURL: URL {
        guard let urlString = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String else {
            fatalError("BASE_URL not found in Info.plist")
        }

        print("[DEBUG] BASE_URL raw string =", urlString)
        
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL string: \(urlString)")
        }

        return url
    }


    var headers: [String : String]? {
        let header = [
            "Content-Type": "application/json"
        ]
        return header
    }

    var sampleData: Data {
        return Data()
    }
}
