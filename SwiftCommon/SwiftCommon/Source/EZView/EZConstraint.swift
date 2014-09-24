//
//  EZVConstraint.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 6/18/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit


public typealias _C = EZConstraint

@objc public class EZConstraint: NSLayoutConstraint {
    
    public class func centered(fromItem: AnyObject!, toItem: AnyObject!) -> [NSLayoutConstraint] {
        return [_C.centerHorizontal(fromItem, toItem: toItem), _C.centerVertical(fromItem, toItem: toItem)]
    }
    
    public class func fill(view: UIView, container: UIView, bottomOf:UIView, topOf: UIView, insets: UIEdgeInsets) {
        let leading = _C.leading(view, toItem: container, amount: insets.left)
        let trailing = _C.trailing(view, toItem: container, amount: insets.right)
        container.addConstraints([leading, trailing])
        container.addConstraint(_C.bottomToTop(bottomOf, topOfItem: view, amount: insets.top))
        container.addConstraint(_C.bottomToTop(view, topOfItem: topOf, amount: insets.bottom))
    }
    
    public class func sizeConstraint(fromItem: AnyObject, size: CGSize) -> [NSLayoutConstraint] {
        return [
            _C.width(fromItem, width: size.width),
            _C.height(fromItem, height: size.height)]
    }
    
    public class func lowPrioritySizeConstraint(fromItem: AnyObject, size: CGSize) -> [NSLayoutConstraint] {
        let width = _C.width(fromItem, width: size.width)
        let height = _C.height(fromItem, height: size.height)
        width.priority = 250.0
        height.priority = 250.0
        return [width, height]
    }
    
    public class func visualFormat(format: String, viewsInfo: NSDictionary) -> [AnyObject] {
        return NSLayoutConstraint.constraintsWithVisualFormat(format,
            options: NSLayoutFormatOptions.AlignAllBaseline,
            metrics: nil,
            views: viewsInfo);
    }

    public class func topToBottom(topOfItem: AnyObject!, bottomOfItem: AnyObject!, amount: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: topOfItem,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: bottomOfItem,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: amount)
    }
    
    public class func bottomToTop(bottomOfItem: AnyObject!, topOfItem: AnyObject!, amount: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: bottomOfItem,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: topOfItem,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1.0,
            constant: amount)
    }
    
    public class func top(fromItem: AnyObject!, toItem: AnyObject!, amount: CGFloat = 20.0) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: fromItem,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: toItem,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1.0,
            constant: amount)
    }
    
    public class func bottom(fromItem: AnyObject!, toItem: AnyObject!, amount: CGFloat = -20.0) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: fromItem,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: toItem,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: amount)
    }
    
    public class func width(fromItem: AnyObject!, width: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: fromItem,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1.0,
            constant: width)
    }
    
    public class func height(fromItem: AnyObject!, height: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: fromItem,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1.0,
            constant: height)
    }
    
    public class func leading(fromItem: AnyObject!, toItem: AnyObject!, amount: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: fromItem,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: toItem,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1.0,
            constant: amount)
    }
    
    public class func trailing(fromItem: AnyObject!, toItem: AnyObject!, amount: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: fromItem,
            attribute: NSLayoutAttribute.Trailing,
            relatedBy: NSLayoutRelation.Equal,
            toItem: toItem,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1.0,
            constant: amount)
    }
    
    public class func centerHorizontal(fromItem: AnyObject!, toItem: AnyObject!) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: fromItem,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: toItem,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1.0,
            constant: 0.0)
    }
    
    public class func centerVertical(fromItem: AnyObject!, toItem: AnyObject!) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: fromItem,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: toItem,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 1.0,
            constant: 0.0)
    }
}
