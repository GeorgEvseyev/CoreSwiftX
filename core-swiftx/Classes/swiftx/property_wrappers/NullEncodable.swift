//
//  NullEncodable.swift
//  core-swiftx
//
//  Created by Максим Гордиенко on 3/4/22.
//

import Foundation

@propertyWrapper
public struct NullEncodable<T : Encodable> : Encodable, Hashable where T : Hashable {
    public init(wrappedValue: T? = nil) {
        self.wrappedValue = wrappedValue
    }
    
    public var wrappedValue: T?
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch wrappedValue {
        case .some(let value): try container.encode(value)
        case .none: try container.encodeNil()
        }
    }
}
