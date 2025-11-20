//
//  ScreenOrientation.swift
//  CoreSwiftX
//
//  Created by Максим Гордиенко on 12.03.2022.
//

import Foundation

public extension UIInterfaceOrientation {
    static var current : UIInterfaceOrientation {
        UIApplication.shared.statusBarOrientation
    }
}
