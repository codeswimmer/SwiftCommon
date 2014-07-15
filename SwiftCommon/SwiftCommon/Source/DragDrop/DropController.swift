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
    
    func didCompleteAcceptDrop(view: UIView) {
        view.removeFromSuperview()

        if let dropTarget = activeDropTarget {
            dropTarget.unhilight()
        }
    }

    // MARK: Initialization
    init(dragger: ViewDragger) {
        dragger.didBeginDragging = didBeginDragging
        dragger.didDrag = didDrag
        dragger.didEndDragging = didEndDragging
        
        animations.didCompleteAcceptDrop = didCompleteAcceptDrop
    }
    
    // MARK: External Variables
    var animations = DropAnimations()
    
    // MARK: Internal Variables
    var draggableViews =  [UIView]()
    var dropTargets = [DropTargetView]()
    var activeDropTarget: DropTargetView?
}
