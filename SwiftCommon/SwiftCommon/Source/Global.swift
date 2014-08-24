//
//  Global.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/13/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import Foundation

// In lieu of using println() in default: switch statements that do nothing
public func nothing() {}

// MARK: Functions
public typealias Closure = ()->Void

// MARK: Types
public typealias BoolValueTuple = (oldValue: Bool, newValue: Bool)
