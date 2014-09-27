//
//  UIEdgeInsets+Utils.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 9/27/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit


extension UIEdgeInsets {
    var width: CGFloat {return left + right}
    var height: CGFloat {return top + bottom}
    
    static func insetsWithEqualSize(s: CGFloat) -> UIEdgeInsets {return UIEdgeInsetsMake(s, s, s, s)}
}
