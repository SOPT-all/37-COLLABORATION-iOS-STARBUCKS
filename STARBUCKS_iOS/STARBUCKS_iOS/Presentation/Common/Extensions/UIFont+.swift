//
//  UIFont+.swift
//  STARBUCKS_iOS
//
//  Created by 진소은 on 11/17/25.
//


import UIKit

extension UIFont {
    
    enum Family: String, CaseIterable {
        case Black, Bold, ExtraBold, ExtraLight, Light, Medium, Regular, Semibold, Thin
    }
    
    enum PretendardStyle {
        case head_b_21
        case head_b_20
        case head_b_17
        case head_sb_18
        case head_sb_14
        case head_sb_12
        case head_m_16
        case head_m_15
        
        case body_b_22
        case body_b_16
        case body_sb_13
        case body_m_16
        case body_r_15
        case body_r_13
        case body_r_12
        
        case caption_b_11
        case caption_r_14
        case caption_r_13
        case caption_r_12
        case caption_r_11
        case caption_r_10
        case caption_l_10
        
    }
    
    static func pretendard(weight: Family = .Regular, size: CGFloat) -> UIFont {
        if let font = UIFont(name: "Pretendard-\(weight.rawValue)", size: size) {
            return font
        } else {
            print("Pretendard-\(weight.rawValue) loading failed, fallback to system font")
            return .systemFont(ofSize: size)
        }
    }
    
    static func pretendard(_ style: PretendardStyle) -> UIFont {
        switch style {
        case .head_b_21: return .pretendard(weight: .Bold, size: 21)
        case .head_b_20: return .pretendard(weight: .Bold, size: 20)
        case .head_b_17: return .pretendard(weight: .Bold, size: 17)
        case .head_sb_18: return .pretendard(weight: .Semibold, size: 18)
        case .head_sb_14: return .pretendard(weight: .Semibold, size: 14)
        case .head_sb_12: return .pretendard(weight: .Semibold, size: 12)
        case .head_m_16: return .pretendard(weight: .Regular, size: 16)
        case .head_m_15: return .pretendard(weight: .Regular, size: 15)
            
        
        case .body_b_22: return .pretendard(weight: .Bold, size: 22)
        case .body_b_16: return .pretendard(weight: .Bold, size: 16)
        case .body_sb_13: return .pretendard(weight: .Semibold, size: 13)
        case .body_m_16: return .pretendard(weight: .Medium, size: 16)
        case .body_r_15: return .pretendard(weight: .Regular, size: 15)
        case .body_r_13: return .pretendard(weight: .Regular, size: 13)
        case .body_r_12: return .pretendard(weight: .Regular, size: 12)
        
        case .caption_b_11: return .pretendard(weight: .Bold, size: 11)
        case .caption_r_14: return .pretendard(weight: .Regular, size: 14)
        case .caption_r_13: return .pretendard(weight: .Regular, size: 13)
        case .caption_r_12: return .pretendard(weight: .Regular, size: 12)
        case .caption_r_11: return .pretendard(weight: .Regular, size: 11)
        case .caption_r_10: return .pretendard(weight: .Regular, size: 10)
        case .caption_l_10: return .pretendard(weight: .Light, size: 10)
        }
    }
}
