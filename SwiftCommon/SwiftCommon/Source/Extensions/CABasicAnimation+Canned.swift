//
//  CAAnimation(Canned).swift
//  MockerSK
//
//  Created by Keith Ermel on 7/1/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit
import QuartzCore

extension CABasicAnimation {

    class func zoomIn(duration: CFTimeInterval, timingFunction: CAMediaTimingFunction = TimingFunction.EaseInEaseOut) -> CABasicAnimation {
        return CABasicAnimation.scale(0.01, toValue: 1.0, duration: duration, timingFunction: timingFunction)
    }
    
    class func zoomOut(duration: CFTimeInterval, timingFunction: CAMediaTimingFunction = TimingFunction.EaseInEaseOut) -> CABasicAnimation {
        return CABasicAnimation.scale(1.0, toValue: 0.01, duration: duration, timingFunction: timingFunction)
    }
    
    class func scale(fromValue: AnyObject!, toValue: AnyObject!, duration: CFTimeInterval, timingFunction: CAMediaTimingFunction = TimingFunction.EaseInEaseOut) -> CABasicAnimation {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = fromValue
        scaleAnimation.toValue = toValue
        scaleAnimation.duration = duration
        scaleAnimation.fillMode = kCAFillModeForwards
        scaleAnimation.timingFunction = timingFunction
        scaleAnimation.removedOnCompletion = false
        return scaleAnimation
    }

}
