//
//  UIGestureRecognizer+String.swift
//  Mocker
//
//  Created by Keith Ermel on 6/28/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

extension UIGestureRecognizer {
    func description() -> String {
        switch state {
        case .Possible: return "Possible"
        case .Began: return "Began"
        case .Changed: return "Changed"
        case .Ended: return "Ended"
        case .Cancelled: return "Cancelled"
        case .Failed: return "Failed"
        default: return ""
        }
    }
}

