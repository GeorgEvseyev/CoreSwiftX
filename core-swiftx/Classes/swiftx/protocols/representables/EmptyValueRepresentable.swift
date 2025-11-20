//
//  EmptyValueRepresentable.swift
//  core-swiftx
//
//  Created by Максим Гордиенко on 3/4/22.
//

import Foundation


public protocol EmptyValueRepresentable {
    static var emptyValue : Self { get }
    var isEmpty : Bool { get }
}

public extension EmptyValueRepresentable {
    var isNotEmpty : Bool { !isEmpty }
}

public extension Optional where Wrapped : EmptyValueRepresentable {
    func orEmpty() -> Wrapped {
        switch self {
        case .some(let value):
            return value
        case .none:
            return Wrapped.emptyValue
        }
    }
    var isNilOrEmpty : Bool {
        switch self {
        case .some(let value):
            return value.isEmpty
        case .none:
            return true
        }
    }
    var isNotEmpty : Bool {
        return !self.orEmpty().isEmpty
    }
}

extension String : EmptyValueRepresentable {
    public static var emptyValue: String { return "" }
}

extension Array : EmptyValueRepresentable {
    public static var emptyValue: Array<Element> { return [] }
}

extension Dictionary : EmptyValueRepresentable {
    public static var emptyValue: Dictionary<Key, Value> { return [:] }
}

extension Set: EmptyValueRepresentable {
    public static var emptyValue: Set<Element> { return Set() }
}
