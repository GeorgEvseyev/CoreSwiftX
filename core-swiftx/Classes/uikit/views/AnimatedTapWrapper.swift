//
//  AnimatedTapWrapper.swift
//  CoreSwiftX
//
//  Created by Максим Гордиенко on 3/21/22.
//

import Foundation
import UIKit

public class AnimatedTapWrapper<T : UIView> : UIView {
    
    open class Effect<T: UIView> {
        
        public init() {
            
        }
        
        open func onTouchStart(view : T) {
            fatalError("abstract function")
        }
        
        open func onTouchEnd(view : T) {
            fatalError("abstract function")
        }
        
        
    }
    
    open class ScaleEffect<T : UIView> : Effect<T> {
        
        private var scaleStart : Double = 0.978
        private var scaleEnd : Double = 1.0
        
        public override init() {
            super.init()
        }
        
        public init(scaleStart : Double = 0.978, scaleEnd : Double = 1.0) {
            self.scaleStart = scaleStart
            self.scaleEnd = scaleEnd
        }
        
        override open func onTouchStart(view: T) {
            applyScale(view: view, start: true)
        }
        
        override open func onTouchEnd(view: T) {
            applyScale(view: view, start: false)
        }
        
        private func applyScale(view : T, start : Bool) {
            let scale = CGFloat(start ? scaleStart : scaleEnd)
            view.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
        
    }
    
    private var currentAnimateState : Bool = false
    
    public let wrappedView : T
    public var animationEffects = Array<Effect<T>>()
    
    public init(_ wrappedView : T) {
        self.wrappedView = wrappedView
        super.init(frame: .zero)
        addSubview(wrappedView)
        wrappedView.edges(to: self)
    }
    
    private lazy var animator = UIViewPropertyAnimator(duration: 0.15, curve: .easeInOut, animations: { [weak self] in self?.animateViews()})
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        animate(true)
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        animate(false)
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        animate(false)
    }
    
    private func animate(_ animate : Bool) {
        self.currentAnimateState = animate
        animator.stopAnimation(true)
        animator.addAnimations { [weak self] in self?.animateViews() }
        animator.startAnimation()
    }
    
    private func animateViews() {
        animationEffects.forEach {
            currentAnimateState ? $0.onTouchStart(view: wrappedView) : $0.onTouchEnd(view: wrappedView)
        }
    }
    
}
