//
//  ViewDragger.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/13/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

class ViewDragger: NSObject {
    
    // MARK: Drag Delegate Functions
    var didBeginDragging: ((UIView, CGPoint)->Void)?
    var didDrag: ((UIView, CGPoint)->Void)?
    var didEndDragging: ((UIView, CGPoint)->Void)?
    
    // MARK: Drop Delegate Functions
    var didDrop: ((UIView, DropTargetView)->Void)?
    
    // MARK: Public API
    func addView(view: UIView) {
        view.addPanHandler(self, action: "didPan:", toView: view)
        dropController?.draggableViews.append(view)
    }
    
    func removeView(view: UIView) {
        dropController?.draggableViews.remove(view)
    }
    
    // MARK: DropController Delegate
    func didCompleteDrop(view: UIView, target: DropTargetView) {
        tellDropDelegate(didCompleteDrop, view, target)
    }
    
    // MARK: Gesture Handler
    func didPan(pan: UIPanGestureRecognizer) {
        let trans = pan.translationInView(pan.view)
        let touchPoint = pan.locationInView(pan.view.superview)
        
        switch pan.state {
        case .Began:
            dragStart = pan.view.center
            pan.view.layer.setValue(pan.view.layer.zPosition, forKey: zPositionKey)
            pan.view.layer.zPosition = CGFloat(Int.max)
            tellDelegate(didBeginDragging, pan.view, touchPoint)
            
            /* Can't do this in init() because didCompleteDrop (all functions, in fact)
                are nil, so doing it here instead. */
            if !dropController.didCompleteDrop {dropController.didCompleteDrop = didDrop}
            
        case .Changed:
            pan.view.center = _G.point(dragStart.x + trans.x, dragStart.y + trans.y)
            tellDelegate(didDrag, pan.view, touchPoint)
            
        case .Ended:
            pan.view.layer.zPosition = pan.view.layer.valueForKey(zPositionKey) as CGFloat
            tellDelegate(didEndDragging, pan.view, touchPoint)
            
        default: nothing()
        }
    }
    
    // MARK: Delegate Notification
    func tellDelegate(method: ((UIView, CGPoint)->Void)?, _ view: UIView, _ touchPoint: CGPoint) {
        if let m = method {m(view, touchPoint)}
    }
    func tellDropDelegate(method: ((UIView, DropTargetView)->Void)?, _ view: UIView, _ target: DropTargetView) {
        if let m = method {m(view, target)}
    }
    
    // MARK: Initialization
    init(draggedView: UIView) {
        super.init()
        dropController = DropController(dragger: self)
        draggedView.addPanHandler(self, action: "didPan:", toView: draggedView)
    }
    
    var dragStart: CGPoint = CGPointZero
    var dropController: DropController!
    let zPositionKey = "zPositionKey"
}