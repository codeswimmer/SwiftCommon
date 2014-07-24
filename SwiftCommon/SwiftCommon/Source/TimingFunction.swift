//
//  TimingFunction.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/1/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit
import QuartzCore

public struct TimingFunction {
    public static var Linear: CAMediaTimingFunction {return CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)}
    public static var EaseIn: CAMediaTimingFunction {return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)}
    public static var EaseOut: CAMediaTimingFunction {return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)}
    public static var EaseInEaseOut: CAMediaTimingFunction {return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)}
    public static var Default: CAMediaTimingFunction {return CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)}
}
