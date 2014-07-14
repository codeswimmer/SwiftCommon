//
//  ViewDragger.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/13/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

class DropController {
    
    init(dragger: ViewDragger) {
        dragger.didBeginDragging = didBeginDragging
        dragger.didDrag = didDrag
        dragger.didEndDragging = didEndDragging
    }
    
    // MARK: Internal API
    func draggedOverDropTarget(draggedView: UIView, _ touchPoint: CGPoint) -> UIView? {
        
        for item in draggedView.superview.subviews.reverse() {
            if let view = item as? UIView {
                if view == draggedView {continue}
                let isOver = view.frame.intersects(draggedView.frame)
                if isOver {return view}
            }
        }
        return nil
    }
    
    // MARK: ViewDragger Delegate
    func didBeginDragging(view: UIView, touchPoint: CGPoint) {
    }
    
    func didDrag(view: UIView, touchPoint: CGPoint) {
        if let dropTarget = draggedOverDropTarget(view, touchPoint) {
            if !self.hasEntered(dropTarget) {
                dropTarget.layer.setValue(true, forKey: dropTargetKey)
                tellDelegate(didEnterDropTarget, dropTarget)
                lastDropTarget = dropTarget
            }
        }
        else {
            if let dropTarget = lastDropTarget {
                dropTarget.layer.setValue(false, forKey: dropTargetKey)
                tellDelegate(didExitDropTarget, dropTarget)
            }
        }
    }
    
    func hasEntered(dropTarget: UIView) -> Bool {
        if let value: AnyObject = dropTarget.layer.valueForKey(dropTargetKey) {
            if let hasEntered = value as? Bool {
                return hasEntered
            }
        }
        return false
    }
    
    func didEndDragging(view: UIView, touchPoint: CGPoint) {
    }
    
    // MARK: Delegate Notification
    func tellDelegate(method: ((UIView)->Void)?, _ dropTarget: UIView) {if let m = method {m(dropTarget)}}

    var draggableViews =  [UIView]()
    var lastDropTarget: UIView?
    let nameKey = "name"
    let origBorderColorKey = "origBorderColor"
    let dropTargetKey = "dropTarget"
    
    // MARK: Delegate functions
    var didEnterDropTarget: ((UIView)->Void)?
    var didExitDropTarget: ((UIView)->Void)?
}

class ViewDragger: NSObject {
    // MARK: Public API
    func addView(view: UIView) {
        view.addPanHandler(self, action: "didPan:", toView: view)
        dropController?.draggableViews.append(view)
    }
    
    func removeView(view: UIView) {
        dropController?.draggableViews.remove(view)
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
    
    // MARK: Initialization
    init(draggedView: UIView) {
        super.init()
        dropController = DropController(dragger: self)
        draggedView.addPanHandler(self, action: "didPan:", toView: draggedView)
    }
    
    var dragStart: CGPoint = CGPointZero
    var dropController: DropController!
    let zPositionKey = "zPositionKey"
    
    // MARK: Delegate functions
    var didBeginDragging: ((UIView, CGPoint)->Void)?
    var didDrag: ((UIView, CGPoint)->Void)?
    var didEndDragging: ((UIView, CGPoint)->Void)?
}