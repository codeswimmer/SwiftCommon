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

    public func findConstraint(layoutAttribute: NSLayoutAttribute) -> NSLayoutConstraint? {
       return  _Array.firstWhere(constraints(), {item in
            if let c = item as? NSLayoutConstraint {
                if c.firstAttribute == layoutAttribute || c.secondAttribute == layoutAttribute {return true}
            }
            return false
        }) as? NSLayoutConstraint
    }
    
    public class func findConstraintsIn(container: UIView, matchingFirstItem: UIView) -> [AnyObject] {
        let working = _Array.find(container.constraints(), {item in
            if let c = item as? NSLayoutConstraint {
                if let firstItem = c.firstItem as? NSObject {
                    return firstItem == matchingFirstItem
                }
            }
            return false
        })
        return working
    }
    
    public class func findConstraintsIn(container: UIView, firstItem: UIView, firstAttribute: NSLayoutAttribute) -> [AnyObject] {
        let working = _Array.find(container.constraints(), {item in
            if let c = item as? NSLayoutConstraint {
                if let item1 = c.firstItem as? NSObject {return item1 == firstItem && c.firstAttribute == firstAttribute}
            }
            return false
        })
        return working
    }
    
    public func logConstraints() {
        println("constraints: \(constraints().count)")
        for item in constraints() {if let c = item as? NSLayoutConstraint {println("    \(c)")}}
    }
    
    public func centerAtTopOf(container: UIView, _ insets: UIEdgeInsets = UIEdgeInsetsZero) {
        self.addConstraint(_C.height(self, height: self.bounds.size.height))
        container.addConstraint(_C.top(self, toItem: container, amount: insets.top))
        container.addConstraint(_C.leading(self, toItem: container, amount: insets.left))
        container.addConstraint(_C.trailing(self, toItem: container, amount: insets.right))
    }
    
    public func centerWithin(container: UIView) {
        container.addSubview(self)
        container.addConstraints(_C.centered(self, toItem: container))
    }
    
    public func fillWith(fromItem: AnyObject!, _ insets: UIEdgeInsets = UIEdgeInsetsZero) {
        let top = _C.top(fromItem, toItem: self, amount: insets.top)
        let leading = _C.leading(fromItem, toItem: self, amount: insets.left)
        let bottom = _C.bottom(fromItem, toItem: self, amount: insets.bottom)
        let trailing = _C.trailing(fromItem, toItem: self, amount: insets.right)
        self.addConstraints([top, leading, bottom, trailing])
    }

    /** Use this with caution: Remember to add `self` to `toItem` **before** calling this */
    public func fillInto(toItem: AnyObject, _ insets: UIEdgeInsets = UIEdgeInsetsZero) {
        let top = _C.top(self, toItem: toItem, amount: insets.top)
        let leading = _C.leading(self, toItem: toItem, amount: insets.left)
        let bottom = _C.bottom(self, toItem: toItem, amount: insets.bottom)
        let trailing = _C.trailing(self, toItem: toItem, amount: insets.right)
        toItem.addConstraints([top, leading, bottom, trailing])
    }

    public func fillAndAdd(subview: UIView, insets: UIEdgeInsets) {
        insertSubview(subview, atIndex: 0)
        fillWith(subview, insets)
    }

    public func maybeAddSubview(view: UIView?) {if let v = view {addSubview(v)}}
    
    public func borderOn(color: UIColor, _ width: CGFloat = 1.0) {layer.borderOn(color.CGColor, width)}
    public func borderOff() {layer.borderOn(UIColor.clearColor().CGColor, 0.0)}
    public func borderFromView(view: UIView) {borderOn(UIColor(CGColor: view.layer.borderColor), view.layer.borderWidth)}

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
