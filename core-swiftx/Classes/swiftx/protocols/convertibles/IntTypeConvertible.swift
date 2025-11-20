//
//  IntTypeConvertible.swift
//  core-swiftx
//
//  Created by Максим Гордиенко on 3/4/22.
//

import Foundation

public protocol IntTypeConvertible {
    func toIntOrNil() -> Int?
}

public extension IntTypeConvertible {
    func toInt() -> Int {
        guard let url = toIntOrNil() else {
            fatalError("Can not convert \(self) value to Int. Make sure, that value must be always Int-convertible or use toIntOrNil() instead")
        }
        return url
    }
}

extension Decimal : IntTypeConvertible {
    public func toIntOrNil() -> Int? {
        return (self as NSDecimalNumber).intValue
    }
}

extension String : IntTypeConvertible {
    public func toIntOrNil() -> Int? {
        return Int(self)
    }
}

extension Double : IntTypeConvertible {
    public func toIntOrNil() -> Int? {
        return Int(self)
    }
}

extension Float : IntTypeConvertible {
    public func toIntOrNil() -> Int? {
        return Int(self)
    }
}

extension CGFloat : IntTypeConvertible {
    public func toIntOrNil() -> Int? {
        return Int(self)
    }
}

extension Int32 : IntTypeConvertible {
    public func toIntOrNil() -> Int? {
        return Int(self)
    }
}

extension UInt32 : IntTypeConvertible {
    public func toIntOrNil() -> Int? {
        return Int(self)
    }
}

extension Int64 : IntTypeConvertible {
    public func toIntOrNil() -> Int? {
        return Int(self)
    }
}

extension UInt64 : IntTypeConvertible {
    public func toIntOrNil() -> Int? {
        return Int(self)
    }
}
