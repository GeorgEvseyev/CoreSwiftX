//
//  DoubleTypeConvertible.swift
//  core-swiftx
//
//  Created by Максим Гордиенко on 3/4/22.
//

import Foundation

public protocol DoubleTypeConvertible {
    func toDoubleOrNil() -> Double?
}

public extension DoubleTypeConvertible {
    func toDouble() -> Double {
        guard let url = toDoubleOrNil() else {
            fatalError("Can not convert \(self) value to Double. Make sure, that value must be always Double-convertible or use toDoubleOrNil() instead")
        }
        return url
    }
}

extension Decimal : DoubleTypeConvertible {
    public func toDoubleOrNil() -> Double? {
        return (self as NSDecimalNumber).doubleValue
    }
}

extension String : DoubleTypeConvertible {
    public func toDoubleOrNil() -> Double? {
        return Double(self)
    }
}

extension CGFloat : DoubleTypeConvertible {
    public func toDoubleOrNil() -> Double? {
        return Double(self)
    }
}

extension Float : DoubleTypeConvertible {
    public func toDoubleOrNil() -> Double? {
        return Double(self)
    }
}

extension Int : DoubleTypeConvertible {
    public func toDoubleOrNil() -> Double? {
        return Double(self)
    }
}

extension Int32 : DoubleTypeConvertible {
    public func toDoubleOrNil() -> Double? {
        return Double(self)
    }
}

extension UInt32 : DoubleTypeConvertible {
    public func toDoubleOrNil() -> Double? {
        return Double(self)
    }
}

extension Int64 : DoubleTypeConvertible {
    public func toDoubleOrNil() -> Double? {
        return Double(self)
    }
}

extension UInt64 : DoubleTypeConvertible {
    public func toDoubleOrNil() -> Double? {
        return Double(self)
    }
}
