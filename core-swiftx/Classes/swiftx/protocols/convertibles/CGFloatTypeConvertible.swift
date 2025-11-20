//
//  CGFloatTypeConvertible.swift
//  core-swiftx
//
//  Created by Максим Гордиенко on 3/4/22.
//

import Foundation

public protocol CGFloatTypeConvertible {
    func toCGFloatOrNil() -> CGFloat?
}

public extension CGFloatTypeConvertible {
    func toCGFloat() -> CGFloat {
        guard let url = toCGFloatOrNil() else {
            fatalError("Can not convert \(self) value to CGFloat. Make sure that value is always CGFloat-convertible or use toCGFloatOrNil() instead.")
        }
        return url
    }
}

extension String : CGFloatTypeConvertible {
    public func toCGFloatOrNil() -> CGFloat? {
        return toFloatOrNil()?.toCGFloatOrNil()
    }
}

extension Float : CGFloatTypeConvertible {
    public func toCGFloatOrNil() -> CGFloat? {
        return CGFloat(self)
    }
}

extension Double : CGFloatTypeConvertible {
    public func toCGFloatOrNil() -> CGFloat? {
        return CGFloat(self)
    }
}

extension Int : CGFloatTypeConvertible {
    public func toCGFloatOrNil() -> CGFloat? {
        return CGFloat(self)
    }
}

extension Int32 : CGFloatTypeConvertible {
    public func toCGFloatOrNil() -> CGFloat? {
        return CGFloat(self)
    }
}

extension UInt32 : CGFloatTypeConvertible {
    public func toCGFloatOrNil() -> CGFloat? {
        return CGFloat(self)
    }
}

extension Int64 : CGFloatTypeConvertible {
    public func toCGFloatOrNil() -> CGFloat? {
        return CGFloat(self)
    }
}

extension UInt64 : CGFloatTypeConvertible {
    public func toCGFloatOrNil() -> CGFloat? {
        return CGFloat(self)
    }
}
