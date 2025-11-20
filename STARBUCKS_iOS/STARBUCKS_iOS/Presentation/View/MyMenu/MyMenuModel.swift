//
//  MyMenuModel.swift
//  STARBUCKS_iOS
//
//  Created by 이서현 on 11/17/25.
//

import UIKit

enum MenuCategory {
    case drink
    case food
}

struct MyMenuModel {
    let id: Int
    let customName: String
    let officialName: String
    let detail: String?
    let price: String
    let imageName: UIImage
    let category: MenuCategory
}

extension MyMenuModel {
  static let mock: [MyMenuModel] = [
    .init(id: 1, customName: "나만의 코코 말차", officialName: "코코 말차", detail: "제가 너무 좋아해용", price: "6,400원", imageName: UIImage.imageHomeBanner7 , category: .drink),
    .init(id: 2, customName: "나만의 블글라", officialName: "아이스 블랙 글레이즈드 라떼", detail: "스카치 캔디 맛이 나요", price: "6,400원", imageName: UIImage.imageHomeBanner7 , category: .drink),
    .init(id: 3, customName: "나만의 샌디치", officialName: "햄 & 어니언 멜팅치즈 샌드위치", detail: "배고파요", price: "6,400원", imageName: UIImage.imageHomeBanner7 , category: .food),
    .init(id: 4, customName: "나만의 커피", officialName: "아이스 아메리카노", detail: "잠이 안 와요", price: "5,100원", imageName: UIImage.imageHomeBanner7 , category: .drink),
    .init(id: 5, customName: "나만의 코코 말차", officialName: "코코 말차", detail: "제가 너무 좋아해용", price: "6,400원", imageName: UIImage.imageHomeBanner7 , category: .drink),
    .init(id: 6, customName: "나만의 블글라", officialName: "아이스 블랙 글레이즈드 라떼", detail: "스카치 캔디 맛이 나요", price: "6,400원", imageName: UIImage.imageHomeBanner7 , category: .drink),
    .init(id: 7, customName: "나만의 샌디치", officialName: "햄 & 어니언 멜팅치즈 샌드위치", detail: "배고파요", price: "6,400원", imageName: UIImage.imageHomeBanner7 , category: .food),
    .init(id: 8, customName: "나만의 커피", officialName: "아이스 아메리카노", detail: "잠이 안 와요", price: "5,100원", imageName: UIImage.imageHomeBanner7 , category: .drink)
  ]
}
