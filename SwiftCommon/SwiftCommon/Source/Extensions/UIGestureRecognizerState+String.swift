//
//  UIGestureRecognizerState+String.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/13/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

extension UIGestureRecognizerState {
    
    func description() -> String {
        switch self {
        case .Began: return "Began"
        case .Cancelled: return "Cancelled"
        case .Changed: return "Changed"
        case .Ended: return "Ended"
        case .Failed: return "Failed"
        case .Possible: return "Possible"
        }
    }
}