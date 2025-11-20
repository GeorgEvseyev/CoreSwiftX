//
//  UIViewControllerExtensions.swift
//  CocoaLumberjack
//
//  Created by Максим Гордиенко on 3/31/22.
//

import Foundation


public extension UIViewController {
    enum AlertType {
        
        public enum TimeoutAction {
            case Success, Deny, Custom(()->Void)
        }
        
        case InfoDialog(_ message : String, _ title : String = "Message")
        
        case YesNoDialog(_ message : String, onSuccess: ()->Void, onDeny: ()->Void, yesText : String = "Yes", noText: String = "No")
        
        case TextFieldDialog(title : String, message : String, enteredCallback: (String) -> Void, inputType : UIKeyboardType)
        
        case TimeoutDialog(_ message : String, onSuccess: () -> Void, onDeny: ()->Void, timeoutAction: TimeoutAction, timeout: Int, yesText : String = "Yes", noText: String = "No")
        
    }
    
    func presentAlert(_ type : AlertType) {
        var alert : UIAlertController? = nil
        var animated : Bool = true
        switch type {
        case .InfoDialog(let message, let title):
            alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert?.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                alert?.dismiss(animated: true, completion: nil)
            }))
            animated = true
        case .YesNoDialog(let message, let successClosure, let denyClosure, let yesText, let noText):
            alert = UIAlertController(title: "Attention!", message: message, preferredStyle: .alert)
            let posAction = UIAlertAction(title: noText, style: .default, handler: { action in
                denyClosure()
            })
            alert?.addAction(posAction)
            alert?.addAction(UIAlertAction(title: yesText, style: .destructive, handler: { action in
                successClosure()
            }))
            animated = true
        case .TextFieldDialog(let title, let message, let callback, let keyboardType):
            alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
            alert?.addTextField { tf in
                tf.keyboardType = keyboardType
            }
            alert?.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                let arr = alert?.textFields ?? []
                let tf = arr.indices.contains(0) ? arr[0] : nil
                callback(tf?.text ?? "")
            }))
            animated = true
        case .TimeoutDialog(let message, let onSuccess, let onDeny, let timeoutAction, let timeout, let yesText, let noText):
            let a = TimeoutAlertController(title: nil, message: message, preferredStyle: .alert)
            a.initialize(message, onSuccess: onSuccess, onDeny: onDeny, timeoutAction: timeoutAction, timeout: timeout, yesText: yesText, noText: noText)
            alert = a
            animated = true
        }
        alert?.modalPresentationStyle = .none
        if let a = alert {
            self.present(a, animated: animated, completion: nil)
        }
    }
    
    
}
