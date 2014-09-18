//
//  CLBeacon+UtilsTests.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 9/18/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//


import XCTest
import CoreBluetooth

class CLBeacon_Utils_Tests: XCTestCase {
    
    func test_CBPeripheralManagerState_description() {
        verify(CBPeripheralManagerState.PoweredOff.description() == "Powered Off")
        verify(CBPeripheralManagerState.PoweredOn.description() == "Powered On")
        verify(CBPeripheralManagerState.Resetting.description() == "Resetting")
        verify(CBPeripheralManagerState.Unauthorized.description() == "Unauthorized")
        verify(CBPeripheralManagerState.Unsupported.description() == "Unsupported")
    }
    
    func verify(action: @autoclosure ()->Bool) {
        XCTAssertTrue(action(), "")
    }
}
