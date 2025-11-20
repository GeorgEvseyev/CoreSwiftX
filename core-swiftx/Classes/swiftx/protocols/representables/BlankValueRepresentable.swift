//
//  BlankValueRepresentable.swift
//  core-swiftx
//
//  Created by Максим Гордиенко on 3/4/22.
//

import Foundation

public protocol BlankValueRepresentable {
    var isBlank : Bool { get }
}

public extension BlankValueRepresentable {
    var isNotBlank : Bool {
        isBlank
    }
}

public extension Optional where Wrapped : BlankValueRepresentable {
    var isNilOrBlank : Bool {
        switch self {
        case .some(let value): return value.isBlank
        case .none: return true
        }
    }
}

extension String : BlankValueRepresentable {
    public var isBlank: Bool {
        return count == 0 || allSatisfy { $0.isWhitespace }
    }
}
