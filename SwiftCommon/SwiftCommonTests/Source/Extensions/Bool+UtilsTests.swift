//
//  Bool+UtilsTests.swift
//  SwiftCommonCommon
//
//  Created by Keith Ermel on 7/8/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//


import XCTest

class Bool_Utils_Tests: XCTestCase {
    
    func testToggle() {
        var flag = false
        flag.toggle()
        XCTAssertTrue(flag, "flag should be true")
        
        flag.toggle()
        XCTAssertFalse(flag, "flag should be false")
    }
}
