//
//  UIView+ForEach.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/1/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit


public func forEach<T>(list: [AnyObject], task: (T)->Void) {
    for item: AnyObject in list {if let x: T = item as? T {task(x)}}
}


extension UIView {
    public func forEachSubview(task: (UIView) -> Void) {forEach(self.subviews, task)}
    public func forEachConstraint(task: (NSLayoutConstraint) -> Void) {forEach(self.constraints(), task)}
    
    public func walkViewHierarchy(var level: Int, task: (Int,UIView) -> Void) {
        task(level, self)
        level = level + 1
        forEachSubview({subview in subview.walkViewHierarchy(level, task)})
    }
    
    public func debugDescription() -> String {
        var viewDesc: String = description
        let viewClassStart = viewDesc.substringFromIndex(viewDesc.startIndex.successor())
        let options = NSStringCompareOptions.CaseInsensitiveSearch
        if let endRange = viewClassStart.rangeOfString(";", options: options, range: nil, locale: nil) {
            return viewClassStart.substringToIndex(endRange.endIndex.predecessor())
        }
        return ""
    }
}
