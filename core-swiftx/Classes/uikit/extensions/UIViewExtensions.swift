//
//  UIViewExtensions.swift
//  core-swiftx
//
//  Created by Максим Гордиенко on 3/4/22.
//

import Foundation

public extension UIView {
    func removeAllSubviews() {
        subviews.forEach {
            $0.removeFromSuperview()
        }
    }
}
