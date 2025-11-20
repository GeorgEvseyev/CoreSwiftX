//
//  Description.swift
//  core-swiftx
//
//  Created by Максим Гордиенко on 3/4/22.
//

import Foundation

public extension Optional {
    var descriptionOrEmpty: String {
        return self.flatMap(String.init(describing:)) ?? ""
    }
    
    var descriptionOrNil: String {
        return self.flatMap(String.init(describing:)) ?? "nil"
    }
}
