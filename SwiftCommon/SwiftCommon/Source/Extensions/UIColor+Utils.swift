//
//  UIColor+Utils.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/6/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

public extension UIColor {
    
    public class func black(alpha: CGFloat) -> UIColor {return UIColor.blackColor().colorWithAlphaComponent(alpha)}
    public class func white(alpha: CGFloat) -> UIColor {return UIColor.whiteColor().colorWithAlphaComponent(alpha)}
    
    public class func gray(alpha: CGFloat) -> UIColor {return UIColor.grayColor().colorWithAlphaComponent(alpha)}
    public class func lightGray(alpha: CGFloat) -> UIColor {return UIColor.lightGrayColor().colorWithAlphaComponent(alpha)}
    public class func darkGray(alpha: CGFloat) -> UIColor {return UIColor.darkGrayColor().colorWithAlphaComponent(alpha)}
    
    public class func red(alpha: CGFloat) -> UIColor {return UIColor.redColor().colorWithAlphaComponent(alpha)}
    public class func orange(alpha: CGFloat) -> UIColor {return UIColor.orangeColor().colorWithAlphaComponent(alpha)}
    public class func yellow(alpha: CGFloat) -> UIColor {return UIColor.yellowColor().colorWithAlphaComponent(alpha)}
    public class func green(alpha: CGFloat) -> UIColor {return UIColor.greenColor().colorWithAlphaComponent(alpha)}
    public class func blue(alpha: CGFloat) -> UIColor {return UIColor.blueColor().colorWithAlphaComponent(alpha)}
    public class func purple(alpha: CGFloat) -> UIColor {return UIColor.purpleColor().colorWithAlphaComponent(alpha)}
    
    public class func brown(alpha: CGFloat) -> UIColor {return UIColor.brownColor().colorWithAlphaComponent(alpha)}
    public class func cyan(alpha: CGFloat) -> UIColor {return UIColor.cyanColor().colorWithAlphaComponent(alpha)}
    public class func magenta(alpha: CGFloat) -> UIColor {return UIColor.magentaColor().colorWithAlphaComponent(alpha)}
    
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
