//
//  TimeoutAlertController.swift
//  CocoaLumberjack
//
//  Created by Максим Гордиенко on 3/31/22.
//

import Foundation

internal class TimeoutAlertController : UIAlertController {
    
    private var timeout : Int!
    private var timeoutAction : (()->Void)!
    private var yesTextBase : String!
    private var noTextBase : String!
    private var messageTextBase : String!
    private var timer : Timer?
    private var whereToShowTimeout : WhereToShowTimeout!
    
    private var successAction : UIAlertAction!
    private var denyAction : UIAlertAction!
    
    func initialize(_ message : String, onSuccess: @escaping()->Void, onDeny: @escaping() -> Void, timeoutAction: AlertType.TimeoutAction, timeout: Int, yesText : String, noText: String, vibrateOnTimerTick : Bool = true) {
        self.timeout = timeout
        self.messageTextBase = message
        self.successAction = UIAlertAction.init(title: "", style: .default, handler: { _ in
            onSuccess()
        })
        self.denyAction = UIAlertAction.init(title: "", style: .destructive, handler: { _ in
            onDeny()
        })
        self.addAction(successAction)
        self.addAction(denyAction)
        switch timeoutAction {
        case .Success:
            self.timeoutAction = onSuccess
            self.whereToShowTimeout = .onSuccess
        case .Deny:
            self.timeoutAction = onDeny
            self.whereToShowTimeout = .onDeny
        case .Custom(let custom):
            self.timeoutAction = custom
            self.whereToShowTimeout = .onMessage
        }
        self.yesTextBase = yesText
        self.noTextBase = noText
        title = nil
        setupView()
        startTimer(vibrateOnTick: vibrateOnTimerTick)
    }
    
    private func startTimer(vibrateOnTick : Bool) {
        if #available(iOS 10.0, *) {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] _ in
                self?.timeout -= 1
                if vibrateOnTick {
                    //Vibration.heavy.vibrate()
                }
                if self?.timeout ?? 0 <= 0 {
                    self?.timeoutAction()
                    self?.timer?.invalidate()
                    self?.timer = nil
                    self?.dismiss(animated: true, completion: nil)
                    return
                }
                self?.setupView()
            })
        } else {
            // Fallback on earlier versions
        }
    }
    
    private func setupView() {
        let timeoutText = " (\(timeout!)) "
        self.message = messageTextBase + (whereToShowTimeout == .onMessage ? timeoutText : "")
        self.successAction.setValue(yesTextBase + (whereToShowTimeout == .onSuccess ? timeoutText : ""), forKeyPath: "title")
        self.denyAction.setValue(noTextBase  + (whereToShowTimeout == .onDeny ? timeoutText : ""), forKeyPath: "title")
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        super.dismiss(animated: flag, completion: completion)
        timer?.invalidate()
        timer = nil
    }
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
    
    private enum WhereToShowTimeout {
        case onSuccess, onDeny, onMessage
    }
    
}
