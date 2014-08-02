//
//  UIView+Layer.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/13/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func borderOn(color: UIColor, _ width: CGFloat = 1.0) {layer.borderOn(color.CGColor, width)}
    public func roundedCorners(radius: CGFloat) {layer.cornerRadius = radius}
    public func becomeEllipse() {layer.cornerRadius = bounds.width / 2.0}
    public func becomeRectangle() {layer.cornerRadius = 0.0}
}
