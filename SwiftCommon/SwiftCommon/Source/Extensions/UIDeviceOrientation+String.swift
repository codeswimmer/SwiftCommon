//
//  UIDeviceOrientation+String.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/2/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

extension UIDeviceOrientation {
    
    func description() -> String {
        switch self {
        case .FaceDown: return "FaceDown"
        case .FaceUp: return "FaceUp"
        case .LandscapeLeft: return "LandscapeLeft"
        case .LandscapeRight: return "LandscapeRight"
        case .Portrait: return "Portrait"
        case .PortraitUpsideDown: return "PortraitUpsideDown"
        case .Unknown: return "Unknown"
        }
    }
}
