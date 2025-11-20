//
//  ArrayExtensions.swift
//  core-swiftx
//
//  Created by Максим Гордиенко on 3/4/22.
//

import Foundation

public extension Array {
    
    func getOrNil(index : Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
    var lastIndex : Int? {
        self.count == 0 ? nil : self.count - 1
    }

}
