//
//  RandomTests.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/13/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import XCTest

class RandomTests: XCTestCase {
    
    func test_that_number_result_is_greater_than_or_equal_to_min() {
        let min = 5
        let result = Random.number(from: min, to: 10)
        XCTAssertTrue(result >= min, "result should be >= to min")
    }
    
    func test_that_number_result_is_less_than_or_equal_to_min() {
        let max = 10
        let result = Random.number(from: 5, to: max)
        XCTAssertTrue(result <= max, "result should be >= to min")
    }
}

