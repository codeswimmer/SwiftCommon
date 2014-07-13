//
//  String+UtilsTests.swift
//  SwiftExtensions
//
//  Created by Keith Ermel on 7/8/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//


import XCTest

class String_Utils_Tests: XCTestCase {
    
    let string = "Time flies like an arrow"
    let emptyString = ""
    let whitespaceString = "  \t\t\t\n\n    "
    var numCharacters: Int!
    
    override func setUp() {
        super.setUp()
        numCharacters = countElements(string)
    }
    
    func testWords_should_return_nil_if_string_is_empty() {
        let result = emptyString.words()
        
        if let x = result {XCTFail("result should be nil")}
    }
    
    func testWords_should_return_empty_array_if_string_only_contains_whitespace() {
        let result = whitespaceString.words()
        
        XCTAssertNotNil(result, "result should not be nil")
        XCTAssertTrue(result!.isEmpty, "result should be empty")
    }
    
    func testWords() {
        let expected = ["Time", "flies", "like", "an", "arrow"]
        let result = string.words()
        
        XCTAssertTrue(result == expected, "result should equal expected")
    }
    
    func testFullTextRange() {
        let range = string.fullTextRange()
        
        XCTAssertTrue(range.length == numCharacters, "range.length should equal \(numCharacters)")
    }
    
    func testLength() {
        let length = string.length()
        
        XCTAssertTrue(length == numCharacters, "length should equal \(numCharacters)")
    }
    
    func testSubscript() {
        let index = 3
        let characterString = string[index]
        
        XCTAssertTrue(characterString == "e", "character \(index) should be 'e'")
    }
}
