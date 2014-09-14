//
//  GestureAction.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 9/14/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit


public typealias GestureTask = ()->Void


public class GestureAction: NSObject {

    // MARK: Internal API - Required by subclasses
    func configureGesture(actionSelector: Selector) -> UIGestureRecognizer? {return nil}
    
    private func attachGestureToView(view: UIView) {
        if let gesture = configureGesture(Selector("performTask")) {view.addGestureRecognizer(gesture)}
    }
    
    func performTask() {if let task = _task {task()}}
    
    public init(view: UIView, task: GestureTask) {
        _task = task
        super.init()
        attachGestureToView(view)
    }
    
    public var task: GestureTask? {return _task}
    private var _task: GestureTask? = nil
}
