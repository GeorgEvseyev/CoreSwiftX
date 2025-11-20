//
//  SequenceExtensions.swift
//  core-swiftx
//
//  Created by Максим Гордиенко on 3/4/22.
//

import Foundation

public extension Sequence {
    
    @inlinable func forEachIndexed(closure: (Element, Int) -> Void) {
        enumerated().forEach { (index, element) in
            closure(element, index)
        }
    }
    
    @inlinable func mapIndexed<T>(closure: (Element, Int) -> T) -> [T] {
        enumerated().map { (index, element) in
            closure(element, index)
        }
    }
    
    @inlinable func compactMapIndexed<T>(closure: (Element, Int) -> T?) -> [T] {
        enumerated().compactMap { (index, element) in
            closure(element, index)
        }
    }
    
    @inlinable func filterIndexed(closure: (Element, Int) -> Bool) -> [Element] {
        var elements = [Element]()
        forEachIndexed { (element, index) in
            if closure(element, index) {
                elements.append(element)
            }
        }
        return elements
    }
    
    func toArray() -> [Element] {
        Array(self)
    }
    
    func toSet() -> Set<Element> where Element : Hashable {
        Set(self)
    }
    
    func filterNotNil<T>() -> [T] where Element == Optional<T> {
        return self.compactMap { $0 }
    }
    
    @inlinable func distinctBy<R>(selector : (Element) -> R) -> [Element] where R : Hashable {
        var list = [Element]()
        var set = Set<R>()
        for element in self {
            let inserted = set.insert(selector(element)).inserted
            if inserted {
                list.append(element)
            }
        }
        return list
    }
        
    func distinct() -> [Element] where Element : Hashable {
        var list = [Element]()
        var set = Set<Element>()
        for element in self {
            if set.insert(element).inserted {
                list.append(element)
            }
        }
        return list
    }

}

public extension Sequence where Element : Numeric {
    func sum() -> Element {
        return self.reduce(0, +)
    }
}
