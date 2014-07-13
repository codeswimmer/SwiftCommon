//
//  UIView(Animation)Tests.swift
//  MockerSK
//
//  Created by Keith Ermel on 7/8/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import XCTest
import UIKit

class UIView_Animation_Tests: XCTestCase {
    let view: UIView = UIView()
    
    func testToggleHidden() {
        view.hidden = false
        view.toggleHidden()
        XCTAssertTrue(view.hidden, "view should be hidden now")
        
        view.toggleHidden()
        XCTAssertFalse(view.hidden, "view should not be hidden now")
    }
    
    func testHide() {
        view.hidden = false
        view.hide()
        XCTAssertTrue(view.hidden, "view should be hidden now")
    }
    
    func testUnhide() {
        view.hide()
        view.unhide()
        XCTAssertFalse(view.hidden, "view should not be hidden now")
    }
    
    func testVisible() {
        view.unhide()
        XCTAssertTrue(view.isVisible(), "view should be visible")
        XCTAssertFalse(view.isInvisible(), "view should be visible")
    }
    
    func testInvisible() {
        view.hide()
        XCTAssertTrue(view.isInvisible(), "view should be visible")
        XCTAssertFalse(view.isVisible(), "view should be visible")
    }
}
