//
//  NSRange+Utils.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/8/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

extension NSRange {
    func isFound() -> Bool {return self.location != NSNotFound}
    func isNotFound() -> Bool {return self.location == NSNotFound}
}