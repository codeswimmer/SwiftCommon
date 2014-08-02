//
//  UIColor+UtilsTests.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/8/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import XCTest
import UIKit

class UIColor_Utils_Tests: XCTestCase {

    func test_colorWithRGB() {
        let red: Int = 012
        let green: Int = 123
        let blue: Int = 234
        let alpha: CGFloat = 1.0
        let color: UIColor = UIColor.colorWithRGB(red, green, blue)
        
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        XCTAssertTrue((r * 255.0) == red, "red value should equal red fixture")
        XCTAssertTrue((g * 255.0) == green, "green value should equal green fixture")
        XCTAssertTrue((b * 255.0) == blue, "blue value should equal blue fixture")
    }
    
    func test_getRGB() {
        let red: Int = 012
        let green: Int = 123
        let blue: Int = 234
        let alpha: CGFloat = 1.0
        let color: UIColor = UIColor.colorWithRGB(red, green, blue)
        
        var values = color.getRGB()
        println("values: \(values)")
        
        /*
        XCTAssertTrue(values.red == red, "red value should equal red fixture")
        XCTAssertTrue(values.green == green, "green value should equal green fixture")
        XCTAssertTrue(values.blue == blue, "blue value should equal blue fixture")
        XCTAssertTrue(values.alpha == alpha, "alpha value should equal alpha fixture")
*/
    }
}

