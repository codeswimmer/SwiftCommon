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
        if let sv = superview {
            center = _G.point(
                (sv.frame.maxX - sv.frame.origin.x) - frame.width / 2.0,
                (sv.frame.maxY - sv.frame.origin.y) - frame.height / 2.0)
        }
    }
    
    public func positionAtBottomRightOfView(view: UIView) {
        center = _G.point(
            (view.frame.maxX - view.frame.origin.x) - frame.width / 2.0,
            (view.frame.maxY - view.frame.origin.y) - frame.height / 2.0)
    }
    
    public func moveToBottomRightOfFrame(rightOfFrame: CGRect) {
        let r = rightOfFrame
        let x: CGFloat = r.origin.x + (r.width - frame.width)
        let y: CGFloat = r.origin.y + (r.height - frame.height)
        frame = _G.rect(x, y, frame.width, frame.height)        
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