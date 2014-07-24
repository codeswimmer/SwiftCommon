//
//  UIColor+Utils.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/6/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

public extension UIColor {
    
    public class func colorWithRGB(red: Int, _ green: Int, _ blue: Int, _ alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(
            red: CGFloat(red)/255.0,
            green: CGFloat(green)/255.0,
            blue: CGFloat(blue)/255.0,
            alpha: alpha)
    }
    
    public class func grayColor(value: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: value, green: value, blue: value, alpha: alpha)
    }
    
    public func getRGB() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        return (red: (r * 255.0), green: (g * 255.0), blue: (b * 255.0), alpha: a)
    }
}
