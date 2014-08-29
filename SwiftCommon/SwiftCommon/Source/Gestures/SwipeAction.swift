//
//  SwipeAction.swift
//  Artwork
//
//  Created by Keith Ermel on 8/28/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit


public typealias SwipeTask = ()->Void


public class SwipeAction: NSObject {

    // MARK: Public API
    public func attachGestureToView(view: UIView) {
        if swipeGesture == nil {configureSwipeGesture()}
        if let gesture = swipeGesture {view.addGestureRecognizer(gesture)}
    }
    
    // MARK: Internal API
    public func didSwipe() {if let task = _task {task()}}
    
    // MARK: Configuration
    private func configureSwipeGesture() {
        swipeGesture = UISwipeGestureRecognizer(target: self, action: Selector("didSwipe"))
    }
    
    // MARK: Initialization
    public init(view: UIView, task: SwipeTask) {super.init(); _task = task; attachGestureToView(view)}
    public init(task: SwipeTask) {super.init(); _task = task}
    
    // MARK: Variables
    public var swipeGesture: UISwipeGestureRecognizer? = nil
    public var task: SwipeTask? {return _task}
    private var _task: SwipeTask? = nil
}
