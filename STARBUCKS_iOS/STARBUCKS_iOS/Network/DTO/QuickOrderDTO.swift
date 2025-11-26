//
//  QuickOrderDTO.swift
//  STARBUCKS_iOS
//
//  Created by JIN on 11/26/25.
//

import UIKit

// MARK: - Response Wrapper
struct MyMenuResponse: Codable {
    let code: Int
    let msg: String
    let data: MyMenuListDTO
}

// MARK: - Data
struct MyMenuListDTO: Codable {
    let myMenuList: [MyMenuDTO]
}

// MARK: - MyMenu Item
struct MyMenuDTO: Codable {
    let myMenuId: Int
    let myMenuName: String
    let myMenuOption: String
    let myMenuImage: String
}
