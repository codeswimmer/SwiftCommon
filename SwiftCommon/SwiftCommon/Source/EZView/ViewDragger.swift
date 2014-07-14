//
//  ViewDragger.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/13/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

class ViewDragger: NSObject {
    // MARK: Public API
    func addView(view: UIView) {view.addPanHandler(self, action: "didPan:", toView: view)}
    
    // MARK: Gesture Handler
    func didPan(pan: UIPanGestureRecognizer) {
        let trans = pan.translationInView(pan.view)
        let touchPoint = pan.locationInView(pan.view.superview)
        
        switch pan.state {
        case .Began:
            dragStart = pan.view.center
            pan.view.layer.setValue(pan.view.layer.zPosition, forKey: zPositionKey)
            pan.view.layer.zPosition = CGFloat(Int.max)

            pan.view.layer.zPosition++
            tellDelegate(didBeginDragging, pan.view)
            
        case .Changed:
            pan.view.center = _G.point(dragStart.x + trans.x, dragStart.y + trans.y)
            tellDelegate(didDrag, pan.view)
            
        case .Ended:
            pan.view.layer.zPosition = pan.view.layer.valueForKey(zPositionKey) as CGFloat
            tellDelegate(didEndDragging, pan.view)
            
        default: nothing()
        }
    }
    
    // MARK: Delegate Notification
    func tellDelegate(method: ((UIView)->Void)?, _ view: UIView) {
        if let m = method {m(view)}
    }
    
    // MARK: Initialization
    init(draggedView: UIView) {
        super.init()
        draggedView.addPanHandler(self, action: "didPan:", toView: draggedView)
    }
    
    var dragStart: CGPoint = CGPointZero
    let zPositionKey = "zPositionKey"
    
    // MARK: Delegate functions
    var didBeginDragging: ((UIView)->Void)?
    var didDrag: ((UIView)->Void)?
    var didEndDragging: ((UIView)->Void)?
}