//
//  DictionaryExtensions.swift
//  core-swiftx
//
//  Created by Максим Гордиенко on 3/4/22.
//

import Foundation

public extension Dictionary {
    func containsKey(key : Key) -> Bool {
        let value = self[key]
        return value != nil
    }
    var keyset : Set<Key> {
        return Set(self.keys)
    }
}
