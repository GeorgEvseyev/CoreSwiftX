//
//  DecimalExtensions.swift
//  core-swiftx
//
//  Created by Максим Гордиенко on 3/4/22.
//

import Foundation

public extension Decimal {
    func round(to number : Decimal) -> Decimal {
        let temp = self / number
        return Decimal(Double(truncating: temp as NSNumber).rounded()) * number
    }
    
    func round(to : NumberRank) -> Decimal {
        var drounded: Decimal = Decimal()
        var dself = self
        NSDecimalRound(&drounded, &dself, to.rawValue, .plain)
        return drounded
    }
    
    enum NumberRank : Int {
        case integer = 0
        case tenth = 1
        case hundredth = 2
        case thousandth = 3
        case tenThousandth = 4
        case hundredThousandth = 5
        case millionth = 6
        case tenMillionth = 7
        case hundredMillionth = 8
        case billionth = 9
        var decimal : Decimal {
            switch self {
            case .integer:
                return 1
            case .tenth:
                return 0.1
            case .hundredth:
                return 0.01
            case .thousandth:
                return 0.001
            case .tenThousandth:
                return 0.0001
            case .hundredThousandth:
                return 0.00001
            case .millionth:
                return 0.000001
            case .tenMillionth:
                return 0.0000001
            case .hundredMillionth:
                return 0.00000001
            case .billionth:
                return 0.000000001
            }
        }
    }
    
    
}
