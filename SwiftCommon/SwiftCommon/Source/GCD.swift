//
//  GCD.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/5/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import Foundation

public class GCD {

    public typealias DQueue = dispatch_queue_t
    public typealias DTime = dispatch_time_t
    public typealias GCDAction = () -> Void
    
    
    // MARK: Async
    public class func asyncOnMainQueue(action: GCDAction) {dispatch_async(mainQueue, action)}
    public class func asyncOnQueue(queue: DQueue, action: GCDAction) {dispatch_async(queue, action)}
    
    public class func performWithDelayMillis(delay: Int64, action: GCDAction) {
        dispatch_after(timeWith(delay), mainQueue, {action()})
    }
    
    // MARK: Queue Creation
    public class func createSerialQueue(label: String) -> DQueue {
        return dispatch_queue_create(label, DISPATCH_QUEUE_SERIAL)
    }
    
    public class func createConcurrentQueue(label: String) -> DQueue {
        return dispatch_queue_create(label, DISPATCH_QUEUE_CONCURRENT)
    }

    // MARK: Utilities
    public class func isMainQueue() -> Bool {return NSThread.isMainThread()}
    public class func timeWith(millis: Int64) -> DTime {return dispatch_time(timeNow, millis * nanoPerMS)}
    
    // MARK: Constants
    public class var mainQueue: DQueue! {return dispatch_get_main_queue()}
    
    class var timeNow: DTime {return DISPATCH_TIME_NOW}
    class var nanoPerMS: Int64 {return Int64(NSEC_PER_MSEC)}
    
}