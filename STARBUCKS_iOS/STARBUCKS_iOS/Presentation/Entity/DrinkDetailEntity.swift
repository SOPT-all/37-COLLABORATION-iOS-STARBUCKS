//
//  DrinkDetailEntity.swift
//  STARBUCKS_iOS
//
//  Created by 진소은 on 11/25/25.
//

import Foundation

struct DrinkDetailEntity {
    let myMenuId: Int64
    let menuKr: String
    let menuEng: String
    let info: String
    let basePrice: Int
    let isHot: Bool
    let size: DrinkSize
    let sizePrices: SizePriceEntity
    let personalOptions: [PersonalOptionEntity]
    let imageUrl: String
}

enum DrinkSize: String, Codable {
    case tall = "TALL"
    case grande = "GRANDE"
    case venti = "VENTI"

    init(from raw: String?) {
        switch raw?.uppercased() {
        case "TALL": self = .tall
        case "GRANDE": self = .grande
        case "VENTI": self = .venti
        default: self = .tall
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
