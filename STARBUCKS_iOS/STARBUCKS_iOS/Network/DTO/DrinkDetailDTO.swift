//
//  DrinkDetailDTO.swift
//  STARBUCKS_iOS
//
//  Created by 진소은 on 11/24/25.
//

import Foundation

struct MyMenuResponseDTO: Codable {
    let code: Int
    let msg: String
    let data: MyMenuDataDTO
}

struct MyMenuDataDTO: Codable {
    let myMenuId: Int64
    let isHot: Bool?
    let size: String?
    let summary: String
    let personalOptions: [PersonalOptionDTO]?
}

struct PersonalOptionDTO: Codable {
    let name: String
    let price: Int
}

