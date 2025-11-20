//
//  Padding.swift
//  core-swiftx
//
//  Created by Максим Гордиенко on 3/4/22.
//

import Foundation
import UIKit
import TinyConstraints

open class Padding<T : UIView> : UIView {
    
    public let contentView : T
    
    private var leftConstraint : NSLayoutConstraint?
    private var topConstraint : NSLayoutConstraint?
    private var rightConstraint : NSLayoutConstraint?
    private var bottomConstraint : NSLayoutConstraint?
    
    public var padding : UIEdgeInsets {
        didSet {
            leftConstraint?.constant = padding.left
            rightConstraint?.constant = -padding.right
            topConstraint?.constant = padding.top
            bottomConstraint?.constant  = -padding.bottom
            layoutIfNeeded()
        }
    }
    
    public var isSelectable : Bool = false {
        didSet {
            if !isSelectable { backgroundColor = .clear }
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        super.backgroundColor = isSelectable ? UIColorCompat.systemGray5 : backgroundColor
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        super.backgroundColor = backgroundColor
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        super.backgroundColor = backgroundColor
    }
    
    public init(contentView : T, padding : UIEdgeInsets) {
        self.contentView = contentView
        self.padding = padding
        super.init(frame: CGRect.zero)
        setup()
    }
    
    private func setup(){
        addSubview(contentView)
        let constr = contentView.edges(to: self, insets: padding)
        topConstraint = constr[0]
        leftConstraint = constr[1]
        bottomConstraint = constr[2]
        rightConstraint = constr[3]
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

