//
//  GCDTests.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/13/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import XCTest

class GCDTests: XCTestCase {
    
    func testPerformOnMainQueue() {
        var didWork = false
        semaphore = dispatch_semaphore_create(0)
        
        GCD.asyncOnQueue(self.serialQueue) {
            NSThread.sleepForTimeInterval(1)
            GCD.asyncOnMainQueue() {self.semaphoreSignal({didWork = true})}
        }
        
        self.semaphoreWait()
        XCTAssertTrue(didWork, "didWork should be true")
    }
    
    func semaphoreSignal(action: ()->Void) {
        if let s = semaphore {dispatch_semaphore_signal(s)}
        action()
    }

    func semaphoreWait() {
        if let s = semaphore {
            do {NSRunLoop.currentRunLoop().runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 1))
            } while(dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW) != 0)
        }
    }
    
    var semaphore: dispatch_semaphore_t?
    let serialQueue = GCD.createSerialQueue("GCDTests.serial.queue")
    let concurrentQueue = GCD.createConcurrentQueue("GCDTests.concurrent.queue")
}
