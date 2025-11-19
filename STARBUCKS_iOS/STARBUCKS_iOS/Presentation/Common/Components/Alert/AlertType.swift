//
//  AlertType.swift
//  STARBUCKS_iOS
//
//  Created by 안치욱 on 11/19/25.
//

import UIKit

enum AlertType: CaseIterable {
    case reset
    case delete
}

extension AlertType {
    var title: String {
        switch self {
        case .reset: return "퍼스널 옵션을 전체 초기화하시겠어요?"
        case .delete: return "퍼스널 옵션을 삭제하시겠어요?"
        }
    }
    
    var numberOfLines: Int {
        switch self {
        case .reset: return 2
        case .delete: return 1
        }
    }
    
    var width: CGFloat {
        return 329
    }
    
    var height: CGFloat {
        switch self {
        case .reset: return 182
        case .delete: return 167
        }
    }
    
    var cancelTitle: String {
        return "취소"
    }
    
    var confirmTitle: String {
        switch self {
        case .reset: return "전체 초기화"
        case .delete: return "삭제하기"
        }
    }
}
