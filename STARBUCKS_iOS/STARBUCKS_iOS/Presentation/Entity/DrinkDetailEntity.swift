//
//  DrinkDetailEntity.swift
//  STARBUCKS_iOS
//
//  Created by 진소은 on 11/25/25.
//

import Foundation

struct DrinkDetailEntity {
    let myMenuId: Int
    let isHot: Bool

    let hotMenuKr: String
    let hotMenuEng: String
    let hotMenuImageUrl: String
    
    let iceMenuKr: String
    let iceMenuEng: String
    let iceMenuImageUrl: String

    let info: String
    let basePrice: Int
    let size: DrinkSize
    let sizePrices: SizePriceEntity
    let personalOptions: [PersonalOptionEntity]
    let summary: String
}

enum DrinkSize: String, Codable {
    case tall = "TALL"
    case grande = "GRANDE"
    case venti = "VENTI"
    
    init(from raw: String?) {
        switch raw?.uppercased() {
        case "GRANDE": self = .grande
        case "VENTI":  self = .venti
        default:       self = .tall
        }
    }
}

struct SizePriceEntity {
    let tall: Int
    let grande: Int
    let venti: Int
}

struct PersonalOptionEntity {
    let name: String
    let price: Int
}
