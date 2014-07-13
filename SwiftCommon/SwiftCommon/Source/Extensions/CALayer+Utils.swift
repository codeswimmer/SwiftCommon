//
//  CALayer(Utils).swift
//  MockerUI
//
//  Created by Keith Ermel on 7/1/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit
import QuartzCore

extension CALayer {
    func forEachSublayer(task: (CALayer) -> Void) {
        if self.sublayers {
            for item: AnyObject in self.sublayers {if let sublayer: CALayer = item as? CALayer {task(sublayer)}}
        }
    }
    
    func borderOn(color: CGColorRef, _ width: CGFloat = 1.0) {
        self.borderColor = color
        self.borderWidth = width
    }
    
    func borderOff() {
        self.borderColor = UIColor.clearColor().CGColor
        self.borderWidth = 0.0
    }
}
