//
//  StringExtensions.swift
//  core-swiftx
//
//  Created by Максим Гордиенко on 3/4/22.
//

import Foundation

public extension String {
    var utf8Data : Data {
        if let utf8Data = self.data(using: .utf8) {
            return utf8Data
        } else {
            fatalError("Can not create UTF-8 bytes array from this string: \(self)")
        }
    }
    
    func split(by : String) -> [String] {
        return components(separatedBy: by).map { String($0) }
    }
    
    func replace(regex : NSRegularExpression, to : String) -> String {
        return regex.stringByReplacingMatches(in: self, options: [], range: NSMakeRange(0, self.count), withTemplate: to)
    }
        
    func replace(match : String, with: String) -> String {
        return self.replacingOccurrences(of: match, with: with)
    }
        
    func replace(matches: [String], with: String) -> String {
        var str = self
        matches.forEach {
            str = str.replace(match: $0, with: with)
        }
        return str
    }
        
    func trim() -> String {
        return self.trimmingCharacters(in: [" "])
    }
    
    func substring(startIndex : Int, endIndex : Int) -> String {
        let startIndexI = self.index(self.startIndex, offsetBy: startIndex)
        let endIndexI = self.index(self.startIndex, offsetBy: endIndex)
        return String(self[startIndexI..<endIndexI])
    }
    
    static func random(length : Int = 16) -> String {
        let lengthToUse = length < 1 ? 1 : length
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<lengthToUse).map{ _ in letters.randomElement()! })
    }
    
    @inlinable func indexOfFirst(_ predicate : (Character) -> Bool) -> Int {
        for index in indicesRange {
            if predicate(self[index]) {
                return index
            }
        }
        return -1
    }
    
    @inlinable func dropLastWhile(_ predicate: (Character) -> Bool) -> String {
        let reversed = self.reversed()
        let dropped = reversed.drop(while: predicate)
        return String(dropped.reversed())
    }
        
    mutating func set(index : Int, _ value : Character) -> String {
        var chars = Array(self)     // gets an array of characters
        chars[index] = value
        let modifiedString = String(chars)
        return modifiedString
    }
    
    var indicesRange : ClosedRange<Int> {
        return 0...count - 1
    }
    
    subscript (index: Int) -> Character {
        get {
            let charIndex = self.index(self.startIndex, offsetBy: index)
            return self[charIndex]
        }
    }
    
}
