//
//  DataExtensions.swift
//  core-swiftx
//
//  Created by Максим Гордиенко on 3/4/22.
//

import Foundation

public extension Data {
    var utf8String : String {
        String(decoding: self, as: UTF8.self)
    }
}
