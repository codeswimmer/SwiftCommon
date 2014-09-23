//
//  Pulse.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 9/22/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import Foundation


public typealias PulseAction = ()->Void


@objc public class Pulse: NSObject {
    
    // MARK: Public API
    public func pulseWithSeconds(seconds: UInt64, action: PulseAction? = nil) {
        let interval = seconds * NSEC_PER_SEC
        configurePulseTimerWithInterval(interval, action)
    }
    
    public func pulseWithMilliseconds(millis: UInt64, action: PulseAction? = nil) {
        let interval = millis * NSEC_PER_MSEC
        configurePulseTimerWithInterval(interval, action)
    }
    
    public func fireAndForgetWithSeconds(seconds: UInt64, action: PulseAction? = nil) {
        pulseWithSeconds(seconds, action: action)
        isFireAndForget = true
    }
    
    // MARK: Internal API
    private func configurePulseTimerWithInterval(interval: UInt64, _ action: PulseAction? = nil) {
        pulseAction = action
        
        let leeway = 1 * NSEC_PER_SEC
        let period = Int64(interval)
        let start = dispatch_walltime(nil, period)
        dispatch_source_set_timer(pulseTimer, start, interval, leeway)
        dispatch_source_set_event_handler(pulseTimer) {self.didPulse()}
        dispatch_resume(pulseTimer);
    }
    
    private func cancelPulse() {dispatch_source_cancel(pulseTimer)}
    
    private func didPulse() {
        println("didPulse")
        
        if let action = pulseAction {action()}
        if isFireAndForget {cancelPulse()}
    }
    
    // MARK: Initialization
    public override init() {
        pulseTimerQueue = dispatch_queue_create("pulse.timer.queue", nil);
        pulseTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, pulseTimerQueue);
    }
    
    // MARK: Variables
    private var pulseTimerQueue: dispatch_queue_t
    private var pulseTimer: dispatch_source_t
    private var pulseAction: PulseAction?
    private var isFireAndForget = false
}
