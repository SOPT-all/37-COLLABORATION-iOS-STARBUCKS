//
//  Identifiable.swift
//  STARBUCKS_iOS
//
//  Created by JIN on 11/18/25.
//

import UIKit

protocol Identifier {
    static var identifier: String { get }
}

extension Identifier {
    static var identifier: String {
        return String(describing: self)
    }
}

