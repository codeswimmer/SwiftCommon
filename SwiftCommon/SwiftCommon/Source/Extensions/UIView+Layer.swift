//
//  UIView+Layer.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/13/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func borderOn(color: UIColor, _ width: CGFloat = 1.0) {self.layer.borderOn(color.CGColor, width)}
}
