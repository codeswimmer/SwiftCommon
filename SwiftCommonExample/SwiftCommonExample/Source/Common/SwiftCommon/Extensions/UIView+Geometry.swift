//
//  UIView+Geometry.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/2/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

extension UIView {
    
    func positionAtTopLeft(parent: UIView) {
        center = _G.point(frame.width / 2.0, frame.height / 2.0)
    }
    
    func positionAtBottomRight(parent: UIView) {
        center = _G.point(
            (parent.frame.maxX - parent.frame.origin.x) - frame.width / 2.0,
            (parent.frame.maxY - parent.frame.origin.y) - frame.height / 2.0)
    }
    
    func positionAboveTopOf(otherView: UIView) {
    }
    
    func positionBelowBottomOf(otherView: UIView) {
    }
    
    func positionToLeftOf(otherView: UIView) {
    }
    
    func positionToRightOf(otherView: UIView) {
    }
}