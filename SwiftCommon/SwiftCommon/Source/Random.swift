//
//  Random.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 6/11/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import Foundation

public class Random {
    public class func number(from min: Int, to max: Int) -> UInt32 {
        return UInt32(min) + (arc4random() % UInt32(max - min))
    }
}
