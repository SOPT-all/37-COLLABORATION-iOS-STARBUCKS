//
//  MyMenuListDTO.swift
//  STARBUCKS_iOS
//
//  Created by 이서현 on 11/26/25.
//

import Foundation

struct MyMenuListResponseDTO: Codable {
    let code: Int
    let msg: String
    let data: MyMenuListDataDTO
}

struct MyMenuListDataDTO: Codable {
    let myMenuList: [MyMenuDetailDTO]
}

struct MyMenuDetailDTO: Codable {
    let myMenuId : Int
    let categoryName: String
    let myMenuName : String
    let menuName: String
    let myMenuOption: String
    let price: Int
    let myMenuImage: String
}
