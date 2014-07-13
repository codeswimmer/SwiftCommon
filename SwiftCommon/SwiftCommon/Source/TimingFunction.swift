//
//  TimingFunction.swift
//  MockerSK
//
//  Created by Keith Ermel on 7/1/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit
import QuartzCore

struct TimingFunction {
    static var Linear: CAMediaTimingFunction {return CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)}
    static var EaseIn: CAMediaTimingFunction {return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)}
    static var EaseOut: CAMediaTimingFunction {return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)}
    static var EaseInEaseOut: CAMediaTimingFunction {return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)}
    static var Default: CAMediaTimingFunction {return CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)}
}
