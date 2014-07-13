//
//  EZVConstraint.swift
//  EZViewKit
//
//  Created by Keith Ermel on 6/18/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

typealias _C = EZConstraint

class EZConstraint: NSLayoutConstraint {

    class func visualFormat(format: String, viewsInfo: NSDictionary) -> [AnyObject] {
        return NSLayoutConstraint.constraintsWithVisualFormat(format,
            options: NSLayoutFormatOptions.AlignAllBaseline,
            metrics: nil,
            views: viewsInfo);
    }

    class func topToBottom(topOfItem: AnyObject!, bottomOfItem: AnyObject!, amount: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: topOfItem,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: bottomOfItem,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: amount)
    }
    
    class func bottomToTop(bottomOfItem: AnyObject!, topOfItem: AnyObject!, amount: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: bottomOfItem,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: topOfItem,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1.0,
            constant: amount)
    }
    
    class func top(fromItem: AnyObject!, toItem: AnyObject!, amount: CGFloat = 20.0) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: fromItem,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: toItem,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1.0,
            constant: amount)
    }
    
    class func bottom(fromItem: AnyObject!, toItem: AnyObject!, amount: CGFloat = -20.0) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: fromItem,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: toItem,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: amount)
    }
    
    class func width(fromItem: AnyObject!, width: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: fromItem,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1.0,
            constant: width)
    }
    
    class func height(fromItem: AnyObject!, height: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: fromItem,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1.0,
            constant: height)
    }
    
    class func leading(fromItem: AnyObject!, toItem: AnyObject!, amount: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: fromItem,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: toItem,
            attribute: NSLayoutAttribute.Leading,
            multiplier: 1.0,
            constant: amount)
    }
    
    class func trailing(fromItem: AnyObject!, toItem: AnyObject!, amount: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: fromItem,
            attribute: NSLayoutAttribute.Trailing,
            relatedBy: NSLayoutRelation.Equal,
            toItem: toItem,
            attribute: NSLayoutAttribute.Trailing,
            multiplier: 1.0,
            constant: amount)
    }
    
    class func centerHorizontal(fromItem: AnyObject!, toItem: AnyObject!) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: fromItem,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: toItem,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1.0,
            constant: 0.0)
    }
    
    class func centerVertical(fromItem: AnyObject!, toItem: AnyObject!) -> NSLayoutConstraint {
        return NSLayoutConstraint(
            item: fromItem,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: toItem,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 1.0,
            constant: 0.0)
    }
    
    class func centered(fromItem: AnyObject!, toItem: AnyObject!) -> [NSLayoutConstraint] {
        return [_C.centerHorizontal(fromItem, toItem: toItem), _C.centerVertical(fromItem, toItem: toItem)]
    }
}
