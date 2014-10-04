//
//  UIView+Animation.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 6/29/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit
import QuartzCore


public typealias UIViewAnimationCompletion = (Bool) -> Void

// MARK: Visibility
extension UIView {
    
    public func toggleHidden() {hidden = !hidden}
    public func hide() {hidden = true}
    public func unhide() {hidden = false}
    
    public func isVisible() -> Bool {return self.hidden == false}
    public func isInvisible() -> Bool {return !isVisible()}
    
    public func invisiblyChange(change: () -> Void) {hide(); change(); unhide()}
}

// MARK: Animation
extension UIView {

    public func animateConstraint(
          duration: NSTimeInterval,
         animation:(()->Void)? = nil,
        completion: UIViewAnimationCompletion? = nil)
    {
        if let anim = animation {anim()}
        UIView.animateWithDuration(duration,
            animations: {self.layoutIfNeeded()},
            completion: completion)
    }
    
    public func fadeIn(duration: NSTimeInterval, completion: UIViewAnimationCompletion? = nil) {
        let origAlpha = alpha
        invisiblyChange({self.alpha = 0.0})
        UIView.animateWithDuration(duration, animations: {self.alpha = origAlpha}, completion: completion)
    }

    public func fadeBackgroundToBlack(duration: NSTimeInterval, completion: UIViewAnimationCompletion? = nil) {
        fadeBackgroundToColor(duration, color: UIColor.blackColor(), completion: completion)
    }
    
    public func fadeBackgroundToColor(duration: NSTimeInterval, color: UIColor, completion: UIViewAnimationCompletion? = nil) {
        UIView.animateWithDuration(duration, animations: {self.backgroundColor = color}, completion: completion)
    }
    
    public func fadeInText(text: String, duration: NSTimeInterval = 0.5) -> UILabel {
        let r = _G.rect(frame.origin.x, frame.size.height / 2.0, frame.size.width, 50.0)
        let label = UILabel.Builder.start(r.size).text(text).label!
        label.frame = r
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.whiteColor()
        label.alpha = 0.0
        addSubview(label)
        
        UIView.animateWithDuration(duration, animations: {label.alpha = 1.0})
        return label
    }
    
    public func fadeInCenteredText(text: String, duration: NSTimeInterval = 0.5, font: UIFont? = nil) -> UILabel {
        let label = fadeInText(text, duration: duration)
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        if let labelFont = font {label.font = labelFont}
        addConstraints(_C.centered(label, toItem: self))
        return label
    }

    // TODO: iOS 8 Screen Sizing - revisit this function's implementation
    func takeSnapshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0)
        drawViewHierarchyInRect(bounds, afterScreenUpdates:true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    public func zoomIn(duration: NSTimeInterval = 0.3, completion: UIViewAnimationCompletion? = nil) {
        configureZoomedOut()
        UIView.animateWithDuration(duration, animations: {self.configureZoomedIn()}, completion: completion)
    }
    private func configureZoomedIn() {self.alpha = 1.0; self.transform = CGAffineTransformMakeScale(1.0, 1.0)}
    
    public func zoomOut(duration: NSTimeInterval = 0.3, completion: UIViewAnimationCompletion? = nil) {
        UIView.animateWithDuration(duration, animations: {self.configureZoomedOut()}, completion: completion)
    }
    private func configureZoomedOut() {self.alpha = 0.0; self.transform = CGAffineTransformMakeScale(0.01, 0.01)}
    
    public func bouncyZoomIn(
          duration: NSTimeInterval = 0.3,
           damping: CGFloat = 0.4,
          velocity: CGFloat = 0.8,
           options: UIViewAnimationOptions = UIViewAnimationOptions.CurveEaseInOut,
        completion: UIViewAnimationCompletion? = nil)
    {
        self.alpha = 0.0
        self.transform = CGAffineTransformMakeScale(0.01, 0.01)
        
        UIView.animateWithDuration(duration,
                             delay: 0.0,
            usingSpringWithDamping: damping,
             initialSpringVelocity: velocity,
                           options: options,
                        animations: {
                        self.alpha = 1.0
                        self.transform = CGAffineTransformMakeScale(1.0, 1.0)
                        
                        }) {done in
                            self.transform = CGAffineTransformIdentity
                            if let action = completion {action(done)}
                    }
    }
    
    public func bouncyZoomOut(
          duration: NSTimeInterval = 0.3,
           damping: CGFloat = 0.4,
          velocity: CGFloat = 0.8,
           options: UIViewAnimationOptions = UIViewAnimationOptions.CurveEaseInOut,
        completion: UIViewAnimationCompletion? = nil)
    {
        UIView.animateWithDuration(duration,
                             delay: 0.0,
            usingSpringWithDamping: damping,
             initialSpringVelocity: velocity,
                           options: options,
                        animations: {
                            self.alpha = 1.0
                            self.transform = CGAffineTransformMakeScale(1.0, 1.0)
                            
                        }) {done in
                            self.transform = CGAffineTransformIdentity
                            if let action = completion {action(done)}
        }
    }
    
    // TODO: deprecated
    func zoomOut(duration: NSTimeInterval = 0.3) -> CABasicAnimation {
        return zoomOutWithKey("UIView.zoomOut", duration: duration, delegate: nil)
    }
    
    public func zoomOutWithKey(key: String, duration: NSTimeInterval = 0.3, delegate: AnyObject?) -> CABasicAnimation {
        let zoomOutAnimation = CABasicAnimation.zoomOut(duration, timingFunction: TimingFunction.EaseInEaseOut)
        if let animDelegate: AnyObject = delegate {zoomOutAnimation.delegate = animDelegate}
        zoomOutAnimation.setID(key)
        layer.addAnimation(zoomOutAnimation, forKey: key)
        return zoomOutAnimation
    }
    
    func zoomIn(duration: NSTimeInterval = 0.3) -> CABasicAnimation {
        return zoomInWithKey("UIView.zoomIn", duration: duration, delegate: nil)
    }
    
    func zoomInWithKey(key: String, duration: NSTimeInterval = 0.3, delegate: AnyObject?) -> CABasicAnimation {
        let zoomInAnimation = CABasicAnimation.zoomIn(duration, timingFunction: TimingFunction.EaseInEaseOut)
        if let animDelegate: AnyObject = delegate {zoomInAnimation.delegate = animDelegate}
        zoomInAnimation.setID(key)
        layer.addAnimation(zoomInAnimation, forKey: key)
        return zoomInAnimation
    }
}

