//
//  Array+UtilsTests.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/11/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import XCTest

class Array_Utils_Tests: XCTestCase {
    let numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]
    let digits = ["zero", "one", "two", "three", "four", "five"]
    
    func testEach() {
        let expected = 45
        var total = 0
        numbers.each({num in total += num})
        
        XCTAssertTrue(total == expected, "total should equal \(expected)")
    }
    
    func test_that_any_returns_true() {
        let result = numbers.any {$0 < 5}
        
        XCTAssertTrue(result, "result should be true")
    }
    
    func test_that_any_returns_false() {
        let result = numbers.any {$0 > 10}
        
        XCTAssertFalse(result, "result should be false")
    }
    
    func test_that_all_returns_true() {
        let onlyHasNumsUnderTen = numbers.all {$0 < 10}
        
        XCTAssertTrue(onlyHasNumsUnderTen, "onlyHasNumsUnderTen should be true")
    }
    
    func test_that_all_returns_false() {
        let onlyHasOddNums = numbers.all {$0 % 2 == 1}
        
        XCTAssertFalse(onlyHasOddNums, "oddNums should be false")
    }
    
    func test_that_contains_returns_false_when_the_array_does_not_contain_item() {
        let result = numbers.contains(333)
        
        XCTAssertFalse(result, "result should be false")
    }
    
    func test_that_contains_returns_true_when_the_array_contains_the_item() {
        let result = numbers.contains(9)
        
        XCTAssertTrue(result, "result should be true")
    }
    
    func test_that_indexOf_returns_nil_when_item_is_not_contained_in_array() {
        let expected: Int? = nil
        let result = numbers.indexOf(100)
        
        XCTAssertTrue(result == expected, "result should be nil")
    }
    
    func test_that_indexOf_returns_correct_index() {
        let expected = 4
        let result = numbers.indexOf(9)
        
        XCTAssertTrue(result == expected, "result should equal expected")
    }
    
    func testFind() {
        let expected = [4, 1, 3, 2, 0]
        let lowNums = numbers.find {$0 < 5}
        
        XCTAssertTrue(lowNums == expected, "lowNums should equal expected")
    }
    
    func testFindWithIndex() {
        let expected = [1, 2, 0]
        let lowNums = numbers.find {$0 < $1}

        XCTAssertTrue(lowNums == expected, "lowNums should equal expected")
    }
    
    func test_that_first_returns_first_item_that_matches_predicate() {
        let expected = "two"
        let digitsThatBeginWithT = digits.first {$0[0] == "t"}
        
        XCTAssertTrue(digitsThatBeginWithT == expected,
            "digitsThatBeginWithT should equal expected")
    }
    
    func test_that_first_returns_nil_when_nothing_matches_predicate() {
        let expected: String? = nil
        let result = digits.first {$0[0] == "s"}
        
        XCTAssertTrue(result == expected, "result should be nil")
    }
    
    func test_that_firstWhere_results_first_item_that_matches_predicate() {
        let expected = "four"
        let digitsThatBeginWithF = digits.firstWhere {$0[0] == "f"}
        
        XCTAssertTrue(digitsThatBeginWithF == expected,
            "digitsThatBeginWithF should equal expected")
    }
    
    func test_that_firstWhere_returns_nil_when_nothing_matches_predicate() {
        let expected: String? = nil
        let result = digits.firstWhere {$0[0] == "s"}
        
        XCTAssertTrue(result == expected, "result should be nil")
    }
    
    func test_that_firstWhereOrDefault_returns_orDefault_value() {
        let defaultValue = 33
        let result = numbers.firstWhere({item in item >= 100}, orDefault: {defaultValue})
        
        XCTAssertTrue(result == defaultValue, "result should equal defaultValue")
    }
    
    func test_that_firstWhereOrDefault_returns_first_item_matching_predicate() {
        let expected = 3
        let defaultValue = 42
        let result = numbers.firstWhere({item in item % 3 == 0}, orDefault: {defaultValue})

        XCTAssertTrue(result == expected, "result should equal expected")
    }
    
    func testExpand() {
        let expected = [(0, 1), (0, 3), (0, 8), (2, 3), (2, 8)]
        let numbersA = [ 0, 2, 9 ]
        let numbersB = [ 1, 3, 8 ]
        
        let pairs = numbersA.expand { a in
            numbersB
                .find { b in a < b }
                .map { i -> (a: Int, b:Int) in (a, i) }
        }
        
        XCTAssertTrue(pairs.description == expected.description, "pairs should equal expected")
    }
    
    func testTake() {
        let expected = [5, 4, 1, 3, 9]
        let firstFive = numbers.take(5)
        
        XCTAssertTrue(firstFive == expected, "firstFive should equal expected")
    }
    
    func test_that_takeWhile_returns_empty_array_when_first_num_fails_predicate() {
        let expected = []
        let firstNumsLessThanFive = numbers.takeWhile {$0 < 5}
        
        XCTAssertTrue(firstNumsLessThanFive == expected, "result should equal expected")
    }

    func testTakeWhile() {
        let expected = [5, 4, 1, 3]
        let firstNumsLessThanSix = numbers.takeWhile {$0 < 6}
        println("result: \(firstNumsLessThanSix)")
        
        XCTAssertTrue(firstNumsLessThanSix == expected, "result should equal expected")
    }
    
    func testSkip() {
        let expected = [3, 9, 8, 6, 7, 2, 0]
        let allButFirstThree = numbers.skip(3)
        
        XCTAssertTrue(allButFirstThree == expected, "result should equal expected")
    }
    
    func testSkipWhile() {
        let expected = [6, 7, 2, 0]
        let result = numbers.skipWhile {$0 % 6 != 0}
        
        XCTAssertTrue(result == expected, "result should equal expected")
    }
}
