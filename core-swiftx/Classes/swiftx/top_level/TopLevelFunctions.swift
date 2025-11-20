//
//  TopLevelFunctions.swift
//  core-swiftx
//
//  Created by Максим Гордиенко on 3/4/22.
//

import Foundation

@inline(__always) public func with<T, R>(_ object : T, _ block : (T) -> R) -> R {
    return block(object)
}

public func require <T> (_ value : Optional<T>) -> T {
    guard let v = value else { fatalError("Error while requiring value. Type: \(T.self)") }
    return v
}

@inlinable public func `repeat`(times: Int, block : (Int) -> Void) {
    if times <= 0 { return }
    for i in 0...(times - 1) {
        block(i)
    }
}
