//
//  UIColorExtensions.swift
//  core-swiftx
//
//  Created by Максим Гордиенко on 3/4/22.
//

import Foundation

public extension UIColor {
    func inverseColor() -> UIColor {
        var alpha: CGFloat = 1.0
        
        var white: CGFloat = 0.0
        if self.getWhite(&white, alpha: &alpha) {
            return UIColor(white: 1.0 - white, alpha: alpha)
        }
        
        var hue: CGFloat = 0.0, saturation: CGFloat = 0.0, brightness: CGFloat = 0.0
        if self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            return UIColor(hue: 1.0 - hue, saturation: 1.0 - saturation, brightness: 1.0 - brightness, alpha: alpha)
        }
        
        var red: CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: 1.0 - red, green: 1.0 - green, blue: 1.0 - blue, alpha: alpha)
        }
        
        return self
    }
    static var turquoise : UIColor {
        UIColor.init(red: 0/256, green: 230/256, blue: 138/256, alpha: 256/256)
    }
    
    convenience init?(hex : String) {
        if hex.count != 6 {
            return nil
        }
        let rRange = hex.startIndex...hex.index(hex.startIndex, offsetBy: 1)
        let gRange = hex.index(hex.startIndex, offsetBy: 2)...hex.index(hex.startIndex, offsetBy: 3)
        let bRange = hex.index(hex.startIndex, offsetBy: 4)...hex.index(hex.startIndex, offsetBy: 5)

        let r = Float(Int(hex[rRange], radix: 16)!)
        let g = Float(Int(hex[gRange], radix: 16)!)
        let b = Float(Int(hex[bRange], radix: 16)!)

        self.init(red: CGFloat(r / 0xff), green: CGFloat(g / 0xff), blue: CGFloat(b / 0xff), alpha: 255/256)
        
    }
    
}
