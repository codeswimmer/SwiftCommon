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
    
//    public func positionOffscreenTop
}