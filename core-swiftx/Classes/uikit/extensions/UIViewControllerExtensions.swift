//
//  UIViewControllerExtensions.swift
//  CoreSwiftX
//
//  Created by Максим Гордиенко on 3/11/22.
//

import Foundation

public extension UIViewController {
    func registerHideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
