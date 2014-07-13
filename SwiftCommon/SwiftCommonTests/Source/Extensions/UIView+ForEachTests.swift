//
//  UIView(ForEach)Tests.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/8/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import XCTest
import UIKit

class UIView_ForEach_Tests: XCTestCase {
    let view: UIView = UIView()
    
    func testForEachSubview() {
        let numSubviews = 5
        for i in 0..<numSubviews {
            let subview = UIView()
            view.addSubview(subview)
        }
        XCTAssertTrue(view.subviews.count == numSubviews, "there should be \(numSubviews) subviews")
        
        var numTimes = 0
        view.forEachSubview({subview in numTimes += 1})
        XCTAssertTrue(numTimes == numSubviews, "numTimes should equal \(numSubviews)")
    }
    
    func testForEachConstraint() {
        let numConstraints = 3
        for i in 0..<numConstraints {
            let cn = NSLayoutConstraint()
            view.addConstraint(cn)
        }
        XCTAssertTrue(view.constraints().count == numConstraints, "there should be \(numConstraints) constraints")
        
        var numTimes = 0
        view.forEachConstraint({cn in numTimes += 1})
        XCTAssertTrue(numTimes == numConstraints, "numTimes should equal \(numConstraints)")
    }
}
