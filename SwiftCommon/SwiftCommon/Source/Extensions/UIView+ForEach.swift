//
//  UIView+ForEach.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/1/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

func forEach<T>(list: [AnyObject], task: (T) -> Void) {for item: AnyObject in list {if let x: T = item as? T {task(x)}}}

extension UIView {
    func forEachSubview(task: (UIView) -> Void) {forEach(self.subviews, task)}
    func forEachConstraint(task: (NSLayoutConstraint) -> Void) {forEach(self.constraints(), task)}
}
