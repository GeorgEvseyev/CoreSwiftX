//
//  DecimalTypeConvertible.swift
//  core-swiftx
//
//  Created by Максим Гордиенко on 3/4/22.
//

import Foundation

public protocol DecimalTypeConvertible {
    func toDecimalOrNil() -> Decimal?
}

public extension  DecimalTypeConvertible {
    func toDecimal() -> Decimal {
        guard let d = toDecimalOrNil() else {
            fatalError("Can not convert \(self) value to Decimal. Make sure, that value is always Decimal-convertible or use toDecimalOrNil() instead.")
        }
        return d
    }
}

extension Double : DecimalTypeConvertible {
    public func toDecimalOrNil() -> Decimal? {
        return Decimal(self)
    }
}

extension Int : DecimalTypeConvertible {
    public func toDecimalOrNil() -> Decimal? {
        return Decimal(self)
    }
}

extension Float : DecimalTypeConvertible {
    public func toDecimalOrNil() -> Decimal? {
        return toDoubleOrNil()?.toDecimalOrNil()
    }
}

extension String : DecimalTypeConvertible {
    public func toDecimalOrNil() -> Decimal? {
        return Decimal(string: self)
    }
}

extension Int32 : DecimalTypeConvertible {
    public func toDecimalOrNil() -> Decimal? {
        return Decimal(self)
    }
}
