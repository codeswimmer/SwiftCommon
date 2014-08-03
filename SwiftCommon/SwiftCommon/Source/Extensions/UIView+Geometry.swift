//
//  UIView+Geometry.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/2/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func positionAtTopLeftOfSuperview() {
        center = _G.point(frame.width / 2.0, frame.height / 2.0)
    }
    
    public func positionAtBottomRight(parent: UIView) {
        center = _G.point(
            (parent.frame.maxX - parent.frame.origin.x) - frame.width / 2.0,
            (parent.frame.maxY - parent.frame.origin.y) - frame.height / 2.0)
    }
    
    public func positionAtBottomRightOfSuperview() {
        center = _G.point(
            (superview.frame.maxX - superview.frame.origin.x) - frame.width / 2.0,
            (superview.frame.maxY - superview.frame.origin.y) - frame.height / 2.0)
    }
    
    public func positionOffscreenTop() {
        let y = -(UIScreen.mainScreen().bounds.size.height / 2.0)
        frame = _G.rect(frame.origin.x, y, frame.width, frame.height)
    }
    
    public func positionOffscreenBottom() {
        let y = UIScreen.mainScreen().bounds.size.height + (bounds.height / 2.0)
        frame = _G.rect(frame.origin.x, y, frame.width, frame.height)
    }
    
    public func positionOffscreenLeft() {
        let x = -(UIScreen.mainScreen().bounds.size.width / 2.0)
        frame = _G.rect(x, frame.origin.y, frame.width, frame.height)
    }
    
    public func positionOffscreenRight() {
        let x = UIScreen.mainScreen().bounds.size.width + (bounds.width / 2.0)
        frame = _G.rect(x, frame.origin.y, frame.width, frame.height)
    }
    
}