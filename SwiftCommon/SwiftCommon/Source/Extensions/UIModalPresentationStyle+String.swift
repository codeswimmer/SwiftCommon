//
//  UIModalPresentationStyle+String.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 8/16/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

extension UIModalPresentationStyle {
    
    func description() -> String {
        switch self {
        case .FullScreen: return "FullScreen"
        case .PageSheet: return "PageSheet"
        case .FormSheet: return "FormSheet"
        case .CurrentContext: return "CurrentContext"
        case .Custom: return "Custom"
        case .OverFullScreen: return "OverFullScreen"
        case .OverCurrentContext: return "OverCurrentContext"
        case .Popover: return "Popover"
        case .None: return "None"
        default: return "?"
        }
    }
}