//
//  NSRange+UtilsTests.swift
//  SwiftExtensions
//
//  Created by Keith Ermel on 7/8/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//


import XCTest

class NSRange_Utils_Tests: XCTestCase {
    let mineral: NSString = "Iron"
    var text: NSString!
    
    override func setUp() {
        super.setUp()
        text = NSString(format: "I am %@ Man", mineral)
    }
    
    func test_isFound() {
        let range: NSRange = text.rangeOfString(mineral)
        let result = range.isFound()
        XCTAssertTrue(result, "result should be true")
    }
    
    func test_isNotFound() {
        let range: NSRange = text.rangeOfString("Topaz")
        let result = range.isFound()
        XCTAssertFalse(result, "result should be false")
    }
}

