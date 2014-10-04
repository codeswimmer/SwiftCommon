//
//  UIView+Subviews.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 9/25/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

extension UIView {
    
    public func addressString() -> String {return NSString(format: "<%p>", self)}
    public func log() {
        println("\(addressString()) \(tagString()) [\(name())] - \(frame) \(superviewString())")
    }
    public func logViewHierarchy() {walkViewHierarchy({v in println(v.log())})}
    public func maybeAddSubview(view: UIView?) {if let v = view {addSubview(v)}}
    public func superviewString() -> String {
        if let sv = superview {return sv.addressString()}
        else {return ""}
    }
    public func tagString() -> String {return NSString(format: "(%03d)", self.tag)}
    public func withSuper(task: (UIView)->Void) {if let sv = superview{task(sv)}}
}
