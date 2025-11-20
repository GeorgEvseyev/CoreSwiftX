//
//  CoreSwiftXViewController.swift
//  CoreSwiftX
//
//  Created by Максим Гордиенко on 3/11/22.
//

import Foundation
import RxSwift

/// Base class, which provide basic functional for convenient work
open class CoreSwiftXViewController : UIViewController {
    
    private enum State {
        case viewDidLoad, viewWillAppear, viewDidAppear, viewWillDisappear, viewDidDisappear
    }
    
    private let disposeBag = DisposeBag()
    
    open func onKeyboardHeightChanged(height : CGFloat) {
        
    }
    
    open func onOrientationChanged(_ newOrientation : UIInterfaceOrientation) {
            
    }

    
    ///
    public func observeWithLifecycle<T>(_ observable : Observable<T>, _ closure : @escaping (T) -> Void) {
        observable.observe(on: MainScheduler.instance).subscribe(onNext: closure).disposed(by: disposeBag)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(orientation), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidAppear(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidDisappear(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardDidAppear(_ notification : NSNotification) {
        let info = notification.userInfo
        let kbSize = info!["UIKeyboardFrameEndUserInfoKey"] as! CGRect
        onKeyboardHeightChanged(height: kbSize.height)
    }
    
    @objc private func keyboardDidDisappear(_ notification : NSNotification) {
        onKeyboardHeightChanged(height: 0)
    }
    
    @objc private func orientation() {
        onOrientationChanged(UIInterfaceOrientation.current)
    }

    
}
