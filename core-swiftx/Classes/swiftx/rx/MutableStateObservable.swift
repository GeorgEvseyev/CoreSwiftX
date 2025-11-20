//
//  MutableStateObservable.swift
//  CoreSwiftX
//
//  Created by Максим Гордиенко on 3/9/22.
//

import Foundation
import RxSwift

public final class MutableStateObservable<T : Equatable> : StateObservable<T> {
    
    private let subject : BehaviorSubject<T>
    
    public init(_ value : T) {
        subject = BehaviorSubject(value: value)
    }
    
    override public var value: T {
        try! subject.value()
    }
    
    public func emit(_ value : T) {
        subject.onNext(value)
    }
    
    override public func asObservable() -> Observable<T> {
        return subject.distinctUntilChanged().asObservable()
    }
    
}
