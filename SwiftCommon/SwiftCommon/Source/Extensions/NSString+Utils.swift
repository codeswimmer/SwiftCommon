//
//  NSString+Utils.swift
//  SwiftExtensions
//
//  Created by Keith Ermel on 7/8/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import Foundation

extension NSString {
    func fullTextRange() -> NSRange {return NSMakeRange(0, self.length)}
    func trim() -> NSString {return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())}
}
