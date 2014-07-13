//
//  Random.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 6/11/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import Foundation

class Random {
    class func number(from min: Int, to max: Int) -> Int {return min + Int(arc4random()) % (max - min);}
}
