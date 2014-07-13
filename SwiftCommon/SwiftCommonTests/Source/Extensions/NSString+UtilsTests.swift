//
//  NSString+UtilsTests.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/8/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import XCTest

class NSString_Utils_Tests: XCTestCase {
    let string: NSString = "Say hello to my little friend"
    var numCharacters: Int!
    
    override func setUp() {
        super.setUp()
        numCharacters = string.length
    }
    
    func testFullTextRange() {
        let range = string.fullTextRange()
        XCTAssertTrue(range.length == numCharacters, "range.length should equal \(numCharacters)")
    }
    
    func testTrim_should_return_same_string_when_there_is_not_any_whitespace_at_either_end() {
        let trimmed = string.trim()
        XCTAssertTrue(trimmed.isEqualToString(string), "trimmed and string should be equal")
    }
    
    func testTrim_should_return_fixture_when_given_string_begins_with_a_single_space() {
        let aString = NSString(format: " %@", string)
        let result = aString.trim()
        XCTAssertTrue(result.isEqualToString(string), "result and string should be equal")
    }
    
    func testTrim_should_return_fixture_when_given_string_begins_with_multiple_spaces() {
        let aString = NSString(format:"     %@", string)
        let result = aString.trim()
        XCTAssertTrue(result.isEqualToString(string), "result and string should be equal")
    }
    
    func testTrim_should_return_fixture_when_given_string_begins_with_multiple_whitespaces() {
        let aString = NSString(format:" \t  \t\t%@", string);
        let result = aString.trim()
        XCTAssertTrue(result.isEqualToString(string), "result and string should be equal")
    }
    
    func testTrimDoesNotTrimWhitespaceFromMiddle() {
        let result = string.trim()
        XCTAssertTrue(result.isEqualToString(string), "result and string should be equal")
    }
    
    func testTrim_does_not_trim_whitespace_from_middle_but_does_trim_from_ends() {
        let baseString = "i am a string";
        let aString = NSString(format:"  %@  ", baseString);
        let result = aString.trim()
        XCTAssertTrue(result.isEqualToString(baseString), "result and baseString should be equal")
    }
}
