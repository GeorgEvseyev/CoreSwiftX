//
//  StateObservable.swift
//  CoreSwiftX
//
//  Created by Максим Гордиенко on 3/9/22.
//

import Foundation
import RxSwift

open class StateObservable<T : Equatable> : ObservableConvertibleType {
    
    public typealias Element = T
    
    public var value : T {
        fatalError("There are no way to get value from StateObservable base class")
    }
    
    public func asObservable() -> Observable<T> {
        fatalError("There are no way to subscribe StateObservable base class")
    }
}
