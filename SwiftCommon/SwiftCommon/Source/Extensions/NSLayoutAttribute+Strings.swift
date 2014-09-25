//
//  NSLayoutAttribute+Strings.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 9/24/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit


extension NSLayoutAttribute {

    func description() -> String {
        switch self {
        case .Left: return "Left"
        case .Right: return "Right"
        case .Top: return "Top"
        case .Bottom: return "Bottom"
        case .Leading: return "Leading"
        case .Trailing: return "Trailing"
        case .Width: return "Width"
        case .Height: return "Height"
        case .CenterX: return "CenterX"
        case .CenterY: return "CenterY"
        case .Baseline: return "Baseline"
        case .NotAnAttribute: return "NotAnAttribute"
        default: return "?"
        }
    }
}