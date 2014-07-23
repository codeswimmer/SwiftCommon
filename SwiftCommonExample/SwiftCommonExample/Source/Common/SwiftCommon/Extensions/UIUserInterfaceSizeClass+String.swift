//
//  UIUserInterfaceSizeClass+String.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 6/29/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

extension UIUserInterfaceSizeClass {
    func description() -> String {
        switch self {
        case .Compact: return "Compact"
        case .Regular: return "Regular"
        case .Unspecified: return "Unspecified"
        default: return "unknown: \(self)"
        }
    }
}

