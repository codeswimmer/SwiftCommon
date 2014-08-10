//
//  UIView+Layer.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/13/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit


let kCenterKey = "stored.center"
let kFrameKey = "stored.frame"


public extension UIView {
    
    public func borderOn(color: UIColor, _ width: CGFloat = 1.0) {layer.borderOn(color.CGColor, width)}
    public func borderOff() {layer.borderOn(UIColor.clearColor().CGColor, 0.0)}
    public func roundedCorners(radius: CGFloat) {layer.cornerRadius = radius}
    public func becomeEllipse() {layer.cornerRadius = bounds.width / 2.0}
    public func becomeRectangle() {layer.cornerRadius = 0.0}

    public func setName(name: String) {layer.name = name}
    public func name() -> String {return layer.name}
    
    public func storeValue(value: AnyObject?, forKey: String) {layer.setValue(value, forKey: forKey)}
    public func retrieveValueForKey(key: String) -> AnyObject! {return layer.valueForKey(key)}
    public func removeValueForKey(key: String) {layer.setValue(nil, forKey: key)}

    public func pushCenter() {storeCenter()}
    public func popCenter() -> CGPoint {
        if let centerValue = retrieveValueForKey(kCenterKey) as? NSValue {
            let centerPoint = centerValue.CGPointValue()
            removeValueForKey(kCenterKey)
            return centerPoint
        }
        return CGPointZero
    }
    
    public func pushFrame() {storeFrame()}
    public func popFrame() -> CGRect {
        if let frameValue = retrieveValueForKey(kFrameKey) as? NSValue {
            let theFrame = frameValue.CGRectValue()
            removeValueForKey(kFrameKey)
            return theFrame
        }
        return CGRectZero
    }
    
    func storeCenter() {storeValue(NSValue(CGPoint: center), forKey: kCenterKey)}
    func storeFrame() {storeValue(NSValue(CGRect: frame), forKey: kFrameKey)}
}
