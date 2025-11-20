//
//  SafeAreaCompat.swift
//  core-swiftx
//
//  Created by Максим Гордиенко on 3/4/22.
//

import Foundation
import UIKit
import TinyConstraints

public extension UIView {
    var safeAreaInsetsCompat : UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return self.safeAreaInsets
        } else {
            return .zero
        }
    }

    var safeAreaCompat : Constrainable {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide
        } else {
            return self
        }
    }

}
