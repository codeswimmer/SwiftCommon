//
//  GlobalTests.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 9/11/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//


import XCTest

class GlobalTests: XCTestCase {
    typealias TestEither = Either<Int, String>
    let number = 42
    let word = "Global"
    var foo: TestEither {return Either.Left(number)}
    var bar: TestEither {return Either.Right(word)}
    
    func testEither() {
        verify(foo, expected: number)
        verify(bar, expected: word)
    }
    
    func verify(either: TestEither, expected: AnyObject) {
        switch either {
        case .Left(let value):
            println("value: \(value())")
            if let expectedValue = expected as? Int {
                let result = (value() == expectedValue)
                XCTAssertTrue(result, "value != expected")
            }
            else {XCTFail("expected is not Int")}
            
        case .Right(let text):
            println(" text: \(text())")
            if let expectedValue = expected as? String {
                let result = (text() == expectedValue)
                XCTAssertTrue(result, "value != expected")
            }
            else {XCTFail("expected is not String")}
        }
    }
}
