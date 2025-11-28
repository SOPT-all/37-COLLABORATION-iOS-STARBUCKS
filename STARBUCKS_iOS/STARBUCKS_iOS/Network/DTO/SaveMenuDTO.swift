//
//  SaveMenuDTO.swift
//  STARBUCKS_iOS
//
//  Created by 안치욱 on 11/28/25.
//

import Foundation

struct SaveMenuResponseDTO: Codable {
    let code: Int
    let msg: String
}

struct SaveMenuDataDTO: Codable {
    let isHot: Bool
    let size: String
    let personalOptions: [PersonalOptionDTO]
}
