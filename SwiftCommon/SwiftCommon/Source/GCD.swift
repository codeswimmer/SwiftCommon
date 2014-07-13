//
//  GCD.swift
//  MockerSK
//
//  Created by Keith Ermel on 7/5/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import Foundation

class GCD {

    typealias DQueue = dispatch_queue_t
    typealias DTime = dispatch_time_t
    typealias GCDAction = () -> Void
    
    
    // MARK: Async
    class func asyncOnMainQueue(action: GCDAction) {dispatch_async(mainQueue, action)}
    class func asyncOnQueue(queue: DQueue, action: GCDAction) {dispatch_async(queue, action)}
    
    class func performWithDelayMillis(delay: Int64, action: GCDAction) {
        dispatch_after(timeWith(delay), mainQueue, {action()})
    }
    
    // MARK: Queue Creation
    class func createSerialQueue(label: CString) -> DQueue {
        return dispatch_queue_create(label, DISPATCH_QUEUE_SERIAL)
    }
    
    class func createConcurrentQueue(label: CString) -> DQueue {
        return dispatch_queue_create(label, DISPATCH_QUEUE_CONCURRENT)
    }

    // MARK: Utilities
    class func isMainQueue() -> Bool {return NSThread.isMainThread()}
    class func timeWith(millis: Int64) -> DTime {return dispatch_time(timeNow, millis * nanoPerMS)}
    
    // MARK: Constants
    class var mainQueue: DQueue! {return dispatch_get_main_queue()}
    class var timeNow: DTime {return DISPATCH_TIME_NOW}
    class var nanoPerMS: Int64 {return Int64(NSEC_PER_MSEC)}
    
}