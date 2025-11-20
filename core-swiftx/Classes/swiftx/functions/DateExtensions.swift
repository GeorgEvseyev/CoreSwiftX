//
//  DateExtensions.swift
//  core-swiftx
//
//  Created by Максим Гордиенко on 3/4/22.
//

import Foundation

public extension Date {
    init?(years : Int = 0, month : Int = 0, day : Int = 0, hour : Int = 0, minute : Int = 0, second : Int = 0,
        nanoSecond : Int = 0, calendar : Calendar = Calendar.current) {
        let components = DateComponents(calendar: calendar, timeZone: TimeZone.current, year: years, month: month, day: day, hour: hour, minute: minute, second: second, nanosecond: nanoSecond)
        guard let d = calendar.date(from: components) else { return nil }
        self = d
    }
    
    func component(_ component : Calendar.Component) -> Int {
        return Calendar.current.component(component, from: self)
    }
}
