//
//  ZeroValueRepresentable.swift
//  core-swiftx
//
//  Created by Максим Гордиенко on 3/4/22.
//

import Foundation

public protocol ZeroValueRepresentable {
    static var zero : Self { get }
    var isZero : Bool { get }
}

public extension ZeroValueRepresentable {
    var isNotZero : Bool {
        !isZero
    }
}

public extension Optional where Wrapped : ZeroValueRepresentable {
    func orZero() -> Wrapped {
        switch self {
        case .some(let value):
            return value
        case .none:
            return Wrapped.zero
        }
    }
    var isNilOrZero: Bool {
        switch self {
        case .some(let value):
            return value.isZero
        case .none:
            return true
        }
    }
    var isNotZero : Bool {
        return self.orZero().isNotZero
    }
}

extension Int : ZeroValueRepresentable {
    public var isZero: Bool {
        return self == Int.zero
    }
}

extension Double : ZeroValueRepresentable {}

extension Float : ZeroValueRepresentable {}

extension Decimal : ZeroValueRepresentable {}

