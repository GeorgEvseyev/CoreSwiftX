//
//  BoolTypeConvertible.swift
//  core-swiftx
//
//  Created by Максим Гордиенко on 3/4/22.
//

import Foundation

public protocol BoolTypeConvertible {
    func toBoolOrNil() -> Bool?
}

public extension BoolTypeConvertible {
    func toBool() -> Bool {
        guard let url = toBoolOrNil() else {
            fatalError("Can not convert \(self) value to Bool. Make sure, that value must be always Bool-convertible or use toBoolOrNil() instead")
        }
        return url
    }
}

extension String : BoolTypeConvertible {
    public func toBoolOrNil() -> Bool? {
        return Bool(self)
    }
}

extension Int : BoolTypeConvertible {
    public func toBoolOrNil() -> Bool? {
        if self == 0 {
            return false
        } else if self == 1 {
            return true
        } else {
            return nil
        }
    }
}

extension Int32 : BoolTypeConvertible{
    public func toBoolOrNil() -> Bool? {
        if self == 0 {
            return false
        } else if self == 1 {
            return true
        } else {
            return nil
        }
    }
}

extension Int64 : BoolTypeConvertible{
    public func toBoolOrNil() -> Bool? {
        if self == 0 {
            return false
        } else if self == 1 {
            return true
        } else {
            return nil
        }
    }
}

extension UInt32 : BoolTypeConvertible{
    public func toBoolOrNil() -> Bool? {
        if self == 0 {
            return false
        } else if self == 1 {
            return true
        } else {
            return nil
        }
    }
}

extension UInt64 : BoolTypeConvertible{
    public func toBoolOrNil() -> Bool? {
        if self == 0 {
            return false
        } else if self == 1 {
            return true
        } else {
            return nil
        }
    }
}
