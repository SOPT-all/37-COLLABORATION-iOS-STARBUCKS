//
//  NSAttributedString+.swift
//  STARBUCKS_iOS
//
//  Created by 진소은 on 11/17/25.
//

import UIKit

extension NSAttributedString {
    static func pretendard(_ style: UIFont.PretendardStyle, text: String) -> NSAttributedString {
        let font = UIFont.pretendard(style)
        let paragraph = NSMutableParagraphStyle()
        
        switch style {
        case .body_r_12, .caption_b_11:
            paragraph.lineHeightMultiple = 1.35
        case .body_r_13:
            paragraph.lineHeightMultiple = 1.4
        default:
            paragraph.lineHeightMultiple = 1.0
        }
        
        
        return NSAttributedString(string: text, attributes: [
            .font: font,
            .paragraphStyle: paragraph
        ])
    }
}

