//
//  UIInterfaceOrientation+String.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 6/29/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

extension UIInterfaceOrientation {
    func description() -> String {
        switch self {
        case .LandscapeLeft: return "LandscapeLeft"
        case .LandscapeRight: return "LandscapeRight"
        case .Portrait: return "Portrait"
        case .PortraitUpsideDown: return "PortraitUpsideDown"
        default: return "?"
        }
    }
}
