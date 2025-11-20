//
//  FloatTypeConvertible.swift
//  core-swiftx
//
//  Created by Максим Гордиенко on 3/4/22.
//

import Foundation

public protocol FloatTypeConvertible {
    func toFloatOrNil() -> Float?
}

public extension FloatTypeConvertible {
    func toFloat() -> Float {
        guard let url = toFloatOrNil() else {
            fatalError("Can not convert \(self) value to Float. Make sure, that value must be always Float-convertible or use toFloatOrNil() instead")
        }
        return url
    }
}

extension String : FloatTypeConvertible {
    public func toFloatOrNil() -> Float? {
        return Float(self)
    }
}

extension CGFloat : FloatTypeConvertible {
    public func toFloatOrNil() -> Float? {
        return Float(self)
    }
}

extension Double : FloatTypeConvertible {
    public func toFloatOrNil() -> Float? {
        return Float(self)
    }
}

extension Int32 : FloatTypeConvertible {
    public func toFloatOrNil() -> Float? {
        return Float(self)
    }
}

extension UInt32 : FloatTypeConvertible {
    public func toFloatOrNil() -> Float? {
        return Float(self)
    }
}

extension Int64 : FloatTypeConvertible {
    public func toFloatOrNil() -> Float? {
        return Float(self)
    }
}

extension UInt64 : FloatTypeConvertible {
    public func toFloatOrNil() -> Float? {
        return Float(self)
    }
}
