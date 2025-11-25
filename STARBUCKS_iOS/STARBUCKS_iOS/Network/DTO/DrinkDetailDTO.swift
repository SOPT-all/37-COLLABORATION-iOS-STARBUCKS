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
    let categoryName: String
    let myMenuId: Int64
    let menuKr: String
    let menuEng: String
    let info: String
    let price: Int
    let count: Int
    let isHot: Bool?
    let size: String?
    let sizePrices: SizePriceDTO
    let personalOptions: [PersonalOptionDTO]
    let summary: String
    let menuImageUrl: String
}

struct SizePriceDTO: Codable {
    let Tall: Int
    let Grande: Int
    let Venti: Int
}

struct PersonalOptionDTO: Codable {
    let name: String
    let price: Int
}
