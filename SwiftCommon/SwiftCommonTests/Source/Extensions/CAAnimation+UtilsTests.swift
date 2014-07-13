//
//  CAAnimation+UtilsTests.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/8/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//


import XCTest
import UIKit
import QuartzCore

class CAAnimation_Utils_Tests: XCTestCase {
    let view = UIView()
    let anim = CABasicAnimation(keyPath: "transform.scale")
    let animName = "view.transform.scale"
    
    func test_isAnimation_returns_true() {
        anim.setID(animName)
        
        let key = "test_isAnimation_returns_true"
        view.layer.addAnimation(anim, forKey: key)
        
        XCTAssertTrue(anim.isAnimation(animName), "result should be true")
    }

    func test_isAnimation_returns_true_when_using_one_key() {
        anim.setID(animName)

        /* We use the same key for both setID() and addAnimation:forKey() */
        view.layer.addAnimation(anim, forKey: animName)
        
        XCTAssertTrue(anim.isAnimation(animName), "result should be true")
    }
}
