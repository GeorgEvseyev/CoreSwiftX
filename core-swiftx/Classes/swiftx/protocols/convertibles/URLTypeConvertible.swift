//
//  URLTypeConvertible.swift
//  core-swiftx
//
//  Created by Максим Гордиенко on 3/4/22.
//

import Foundation

public protocol URLTypeConvertible {
    func toURLOrNil() -> URL?
}

public extension URLTypeConvertible {
    func toURL() -> URL {
        guard let url = toURLOrNil() else {
            fatalError("Can not convert \(self) value to URL. Make sure, that value is always URL-convertible or use toURLOrNil() instead.")
        }
        return url
    }
}

extension String : URLTypeConvertible {
    public func toURLOrNil() -> URL? {
        URL(string: self)
    }
}
