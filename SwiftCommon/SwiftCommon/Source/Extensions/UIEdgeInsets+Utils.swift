//
//  UIEdgeInsets+Utils.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 9/27/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit


extension UIEdgeInsets {
    
    static public func insetsWithEqualSize(s: CGFloat) -> UIEdgeInsets {return UIEdgeInsetsMake(s, s, s, s)}
    
    public var description: String {return "\(top), \(left), \(bottom), \(right)"}
    public var width: CGFloat {return left + right}
    public var height: CGFloat {return top + bottom}
}
