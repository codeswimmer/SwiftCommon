//
//  UIView+Animation.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 6/29/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit
import QuartzCore


typealias UIViewAnimationCompletion = (Bool) -> Void

// MARK: Visibility
extension UIView {
    
    func toggleHidden() {hidden = !hidden}
    func hide() {hidden = true}
    func unhide() {hidden = false}
    
    func isVisible() -> Bool {return self.hidden == false}
    func isInvisible() -> Bool {return !isVisible()}
    
    func invisiblyChange(change: () -> Void) {hide(); change(); unhide()}
}

// MARK: Animation
extension UIView {

    func animateConstraint(duration: NSTimeInterval, animation:(()->Void)? = nil) {
        if let anim = animation {anim()}
        UIView.animateWithDuration(duration, animations: {self.layoutIfNeeded()})
    }
    
    func fadeIn(duration: NSTimeInterval, completion: UIViewAnimationCompletion? = nil) {
        let origAlpha = alpha
        invisiblyChange({self.alpha = 0.0})
        UIView.animateWithDuration(duration, animations: {self.alpha = origAlpha}, completion: completion)
    }

    func fadeBackgroundToBlack(duration: NSTimeInterval, completion: UIViewAnimationCompletion? = nil) {
        fadeBackgroundToColor(duration, color: UIColor.blackColor(), completion: completion)
    }
    
    func fadeBackgroundToColor(duration: NSTimeInterval, color: UIColor, completion: UIViewAnimationCompletion? = nil) {
        UIView.animateWithDuration(duration, animations: {self.backgroundColor = color}, completion: completion)
    }
    
    func fadeInText(text: String, duration: NSTimeInterval = 0.5) -> UILabel {
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
    
    func fadeInCenteredText(text: String, duration: NSTimeInterval = 0.5, font: UIFont? = nil) -> UILabel {
        let label = fadeInText(text, duration: duration)
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        if let labelFont = font {label.font = labelFont}
        addConstraints(_C.centered(label, toItem: self))
        return label
    }

    func takeSnapshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0)
        drawViewHierarchyInRect(bounds, afterScreenUpdates:true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func zoomOut(duration: NSTimeInterval = 0.3) -> CABasicAnimation {
        return zoomOutWithKey("UIView.zoomOut", duration: duration, delegate: nil)
    }
    
    func zoomOutWithKey(key: String, duration: NSTimeInterval = 0.3, delegate: AnyObject?) -> CABasicAnimation {
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

