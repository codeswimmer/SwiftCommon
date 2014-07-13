//
//  UIColor(Utils).swift
//  MockerSK
//
//  Created by Keith Ermel on 7/6/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func colorWithRGB(red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    
    func getRGB() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        return (red: (r * 255.0), green: (g * 255.0), blue: (b * 255.0), alpha: a)
    }
}
