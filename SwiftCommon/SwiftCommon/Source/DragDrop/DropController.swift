//
//  DropController.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/15/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit
import QuartzCore

class DropController {
    
    // MARK: Delegate Functions
    var didCompleteDrop: ((UIView, DropTargetView)->Void)?
    
    // MARK: Public API
    func addDropTarget(dropTarget: DropTargetView) {dropTargets.append(dropTarget)}
    func removeDropTarget(dropTarget: DropTargetView) {dropTargets.remove(dropTarget)}
    
    // MARK: ViewDragger Delegate
    func didBeginDragging(view: UIView, touchPoint: CGPoint) {}
    
    func didDrag(view: UIView, touchPoint: CGPoint) {
        for dropTarget in dropTargets {
            if dropTarget.hitTestDraggedView(view) {if activeDropTarget == nil {activeDropTarget = dropTarget}}
            else {if let active = activeDropTarget {if active == dropTarget {activeDropTarget = nil}}}
        }
    }
    
    func didEndDragging(view: UIView, touchPoint: CGPoint) {
        if let dropTarget = activeDropTarget {
            if dropTarget.canAcceptDrop(view) {
                animations.performAcceptDrop(view)
            }
        }
    }
    
    func acceptDropDidComplete(view: UIView) {
        view.removeFromSuperview()

        if let dropTarget = activeDropTarget {
            dropTarget.unhilight()
            tellDelegate(didCompleteDrop, view, dropTarget)
        }
    }
    
    // MARK: Delegate Notification
    func tellDelegate(method: ((UIView, DropTargetView)->Void)?, _ view: UIView, _ target: DropTargetView) {
        if let m = method {m(view, target)}
    }

    // MARK: Initialization
    init(dragger: ViewDragger) {
        dragger.didBeginDragging = didBeginDragging
        dragger.didDrag = didDrag
        dragger.didEndDragging = didEndDragging
        
        animations.acceptDropDidComplete = acceptDropDidComplete
    }
    
    // MARK: External Variables
    var animations = DropAnimations()
    
    // MARK: Internal Variables
    var draggableViews =  [UIView]()
    var dropTargets = [DropTargetView]()
    var activeDropTarget: DropTargetView?
}
