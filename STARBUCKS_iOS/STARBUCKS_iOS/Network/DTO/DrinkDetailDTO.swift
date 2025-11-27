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
    let myMenuId: Int
    
    let hotMenuKr: String
    let hotMenuEng: String
    let hotMenuImageUrl: String
    
    let iceMenuKr: String
    let iceMenuEng: String
    let iceMenuImageUrl: String
    
    let info: String
    let price: Int
    let count: Int
    let isHot: Bool
    let size: String
    let sizePrices: SizePriceDTO
    let personalOptions: [PersonalOptionDTO]
    let summary: String
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

extension MyMenuDataDTO {
    func toEntity() -> DrinkDetailEntity {
        return DrinkDetailEntity(
            myMenuId: myMenuId,
            isHot: isHot,
            
            hotMenuKr: hotMenuKr,
            hotMenuEng: hotMenuEng,
            hotMenuImageUrl: hotMenuImageUrl,
            
            iceMenuKr: iceMenuKr,
            iceMenuEng: iceMenuEng,
            iceMenuImageUrl: iceMenuImageUrl,
            
            info: info,
            basePrice: price,
            size: DrinkSize(from: size),
            sizePrices: sizePrices.toEntity(),
            personalOptions: personalOptions.map { $0.toEntity() },
            summary: summary
        )
    }
}

extension SizePriceDTO {
    func toEntity() -> SizePriceEntity {
        SizePriceEntity(
            tall: Tall,
            grande: Grande,
            venti: Venti
        )
    }
}

extension PersonalOptionDTO {
    func toEntity() -> PersonalOptionEntity {
        PersonalOptionEntity(name: name, price: price)
    }
}
