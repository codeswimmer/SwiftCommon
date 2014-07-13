//
//  CALayer(Utils)Tests.swift
//  MockerSK
//
//  Created by Keith Ermel on 7/8/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//


import XCTest
import UIKit
import QuartzCore

class CALayer_Utils_Tests: XCTestCase {
    let view: UIView = UIView()

    func test_forEachSublayer_on_view_with_no_sublayers() {
        var taskWasCalled = false
        
        view.layer.forEachSublayer({sublayer in taskWasCalled = true})
        XCTAssertFalse(taskWasCalled, "task should not have been called")
    }
    
    func test_that_forEachSublayer_invokes_task_for_all_sublayers() {
        let numSublayers = 3
        for i in 0..<numSublayers {
            view.layer.addSublayer(CALayer())
            }
        XCTAssertTrue(view.layer.sublayers.count == numSublayers, "view should have \(numSublayers) sublayers")
        
        var numTimes = 0
        view.layer.forEachSublayer({sublayer in numTimes += 1})
        XCTAssertTrue(numTimes == numSublayers, "numTimes: (\(numTimes)) should equal numSublayers: \(numSublayers)")
    }
    
    func test_that_borderOn_sets_the_border_to_correct_color_and_width() {
        let color: CGColorRef = UIColor.blueColor().CGColor
        let width = 5.0
        view.layer.borderOn(color, width)
        
        XCTAssertTrue(view.layer.borderColor === color, "view.layer.borderColor should be same as color")
        XCTAssertTrue(view.layer.borderWidth == width, "view.layer.borderWidth should be same as width")
    }
    
    func test_that_borderOff_clears_the_border() {
        let color: CGColorRef = UIColor.blueColor().CGColor
        let width = 5.0
        view.layer.borderOn(color, width)
        
        view.layer.borderOff()
        
        let clearColor: CGColorRef = UIColor.clearColor().CGColor
        XCTAssertTrue(view.layer.borderColor === clearColor, "view.layer.borderColor should be clear")
        XCTAssertTrue(view.layer.borderWidth == 0.0, "view.layer.borderWidth should be same as width")
    }
}
