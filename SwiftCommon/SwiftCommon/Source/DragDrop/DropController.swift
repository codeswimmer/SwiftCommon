//
//  DropController.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/15/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

class DropController {
    
    init(dragger: ViewDragger) {
        dragger.didBeginDragging = didBeginDragging
        dragger.didDrag = didDrag
        dragger.didEndDragging = didEndDragging
    }
    
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
        for dropTarget in dropTargets {
            if dropTarget.canAcceptDrop(view) {
                //
            }
        }
    }
    
    // MARK: Delegate Notification
    func tellDelegate(method: ((UIView)->Void)?, _ dropTarget: UIView) {if let m = method {m(dropTarget)}}
    
    var draggableViews =  [UIView]()
    var dropTargets = [DropTargetView]()
    var activeDropTarget: DropTargetView?
    let nameKey = "name"
    
    // MARK: Delegate functions
    var didEnterDropTarget: ((UIView)->Void)?
    var didExitDropTarget: ((UIView)->Void)?
}

