//
//  UISwipeGestureRecognizer+UtilsTests.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/8/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import XCTest
import UIKit

class UISwipeGestureRecognizer_Utils_Tests: XCTestCase {

    func testIsLeft() {
        let swipe = UISwipeGestureRecognizer()
        swipe.direction = UISwipeGestureRecognizerDirection.Left
        XCTAssertTrue(swipe.isLeft(), "swipe direction should be Left")
    }
    
    func testIsRight() {
        let swipe = UISwipeGestureRecognizer()
        swipe.direction = UISwipeGestureRecognizerDirection.Right
        XCTAssertTrue(swipe.isRight(), "swipe direction should be Right")
    }
    
    func testIsUp() {
        let swipe = UISwipeGestureRecognizer()
        swipe.direction = UISwipeGestureRecognizerDirection.Up
        XCTAssertTrue(swipe.isUp(), "swipe direction should be Up")
    }
    
    func testIsDown() {
        let swipe = UISwipeGestureRecognizer()
        swipe.direction = UISwipeGestureRecognizerDirection.Down
        XCTAssertTrue(swipe.isDown(), "swipe direction should be Down")
    }
}
