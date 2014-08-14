//
//  PubSub.swift
//  Artwork
//
//  Created by Keith Ermel on 8/13/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import Foundation


public typealias SubscriberAction = (NSNotification!) -> Void


public protocol Subscriber {
    func onPubSubEventNamed(eventName: String, object: AnyObject!, userInfo: [NSObject : AnyObject]!)
    func observer() -> NSObjectProtocol!
}


public class PubSub {
    
    public class func post(eventName: String) {PubSub.broker.postNotificationName(eventName, object: nil)}

    public class func post(eventName: String, userInfo: [NSObject : AnyObject]!) {
        PubSub.broker.postNotificationName(eventName, object: nil, userInfo: userInfo)
    }
    
    public class func subscribe(eventName: String, subscriber: Subscriber) -> NSObjectProtocol! {
        return PubSub.broker.addObserverForName(eventName, object: nil, queue: PubSub.queue) { (notification) -> Void in
            subscriber.onPubSubEventNamed(eventName, object: nil, userInfo: notification.userInfo)
        }
    }
    
    public class func subscribe(eventName: String, action: SubscriberAction) {
        PubSub.broker.addObserverForName(eventName, object: nil, queue: PubSub.queue, usingBlock: action)
    }
    
    public class func unsubscribe(eventName: String, observer: AnyObject!) {
        PubSub.broker.removeObserver(observer, name: eventName, object: nil)
    }
    
    private class var broker: NSNotificationCenter {return NSNotificationCenter.defaultCenter()}
    private class var queue: NSOperationQueue {return NSOperationQueue.mainQueue()}
    
}

// MARK: EmptySubscriber
public extension PubSub {
    
    public class EmptySubscriber: NSObject, Subscriber {
        
        public func onPubSubEventNamed(eventName: String, object: AnyObject!, userInfo: [NSObject : AnyObject]!) {}
        public func observer() -> NSObjectProtocol! {return "EmptySubscriber.observer"}
        
        struct Static {static let instance: EmptySubscriber = EmptySubscriber()}
        class var shared: EmptySubscriber {return Static.instance}
    }
    
    public class var emptySubscriber: EmptySubscriber {return EmptySubscriber.shared}
}
