//
//  UIView+GeometryTests.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/2/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import XCTest
import UIKit

class UIView_GeometryTests: XCTestCase {
    let viewSize = _G.size(10.0, 10.0)
    var view: UIView!
    
    override func setUp() {
        super.setUp()
        view = UIView(frame: _G.rectWithSize(viewSize))
    }
    
    override func tearDown() {
        view = nil
        super.tearDown()
    }
    
    func testPositionAtTopLeft() {
        let parentView = UIView(frame: _G.rectWithSize(_G.size(100.0, 100.0)))
        view.positionAtTopLeft(parentView)
        
        let frame = view.frame
        XCTAssertTrue(frame.origin.x == 0.0, "origin.x should be 0.0")
        XCTAssertTrue(frame.origin.y == 0.0, "origin.x should be 0.0")
        
        let topLeftCenter = CGPointMake(view.frame.midX, view.frame.midY)
        XCTAssertTrue(view.center == topLeftCenter, "view.center should equal \(topLeftCenter)")
    }
    
    func testPositionAtBottomRight() {
        let parentView = UIView(frame: _G.rectWithSize(_G.size(100.0, 100.0)))
        view.positionAtBottomRight(parentView)
        
        let bottomRightCenter = CGPointMake(
            parentView.frame.maxX - (view.frame.size.width / 2.0),
            parentView.frame.maxY - (view.frame.size.height / 2.0))
        XCTAssertTrue(view.center == bottomRightCenter, "view.center should equal \(bottomRightCenter)")
    }
}

