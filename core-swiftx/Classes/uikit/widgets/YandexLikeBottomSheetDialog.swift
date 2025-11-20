//
//  YandexLikeBottomSheetDialog.swift
//  CoreSwiftX
//
//  Created by Максим Гордиенко on 3/11/22.
//

import Foundation
import TinyConstraints

open class YandexLikeBottomSheetDialog : CoreSwiftXViewController {
    
    private var tag : String?
    private var animationAppearancePassed = false
    public let contentView = UIView()
    private let backgroundView = UIView()
    private var contentViewBottomConstraint : NSLayoutConstraint?
    private let cancellableRecognizer = UITapGestureRecognizer(target: self, action: #selector(onViewClick))
    public var isCancellable = false {
        didSet {
            if isCancellable {
                backgroundView.addGestureRecognizer(cancellableRecognizer)
            } else {
                backgroundView.removeGestureRecognizer(cancellableRecognizer)
            }
        }
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.alpha = 0
        contentView.backgroundColor = UIColorCompat.systemBackground
        view.addSubview(backgroundView)
        backgroundView.edges(to: view)
        view.addSubview(contentView)
        contentView.edges(to: view, excluding: [.top, .bottom])
        contentViewBottomConstraint = contentView.bottom(to: view)
        backgroundView.backgroundColor = UIColorCompat.systemBackground
    }
    
    override open func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if animationAppearancePassed || contentView.bounds.height <= 0 {
            if contentView.bounds.height == 0 {
                print("\(description)'s contentView height is zero!")
            }
            return
        }
        animationAppearancePassed = true
        contentView.transform = CGAffineTransform(translationX: 0, y: contentView.bounds.height)
        UIView.animate(withDuration: 0.5) {
            self.contentView.transform = CGAffineTransform(translationX: 0, y: 0)
            self.backgroundView.alpha = 0.5
        }
    }
    
    public func showDialog(inside : UIViewController, tag : String? = nil) {
        inside.addChild(self)
        inside.view.addSubview(self.view)
        self.view.edges(to: inside.view)
        self.tag = tag
    }
    
    public func dismiss() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
            self.contentView.transform = CGAffineTransform(translationX: 0, y: self.contentView.bounds.height)
            self.backgroundView.alpha = 0
        }, completion: { _ in
            self.removeFromParent()
            self.view.removeFromSuperview()
        })
    }
    
    open override var description: String {
        "YandexLikeBottomSheetDialog: tag: \(tag.descriptionOrNil)"
    }
    
    override open func onKeyboardHeightChanged(height: CGFloat) {
        contentViewBottomConstraint?.constant = -height
        UIView.animate(withDuration: 0.15) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func onViewClick() {
        if !isCancellable { return }
        dismiss()
    }
}

