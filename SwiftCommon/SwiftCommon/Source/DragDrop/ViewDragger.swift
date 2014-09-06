//
//  ViewDragger.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/13/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

public class ViewDragger: NSObject {
    
    // MARK: Drag Delegate Functions
    public var didBeginDragging: ((UIView, CGPoint)->Void)?
    public var didDrag: ((UIView, CGPoint)->Void)?
    public var didEndDragging: ((UIView, CGPoint)->Void)?
    
    // MARK: Drop Delegate Functions
    public var didDrop: ((UIView, DropTargetView)->Void)?
    
    // MARK: Initialization
    public init(draggedView: UIView) {
        super.init()
        dropController = DropController(dragger: self)
        draggedView.addPanHandler(self, action: "didPan:", toView: draggedView)
    }
    
    // MARK: Public API
    public func addView(view: UIView) {
        view.addPanHandler(self, action: "didPan:", toView: view)
        dropController?.draggableViews.append(view)
    }
    
    public func removeView(view: UIView) {dropController?.draggableViews.remove(view)}
    
    // MARK: DropController Delegate
    public func didCompleteDrop(view: UIView, target: DropTargetView) {tellDropDelegate(didCompleteDrop, view, target)}
    
    // MARK: Gesture Handler
    func didPan(pan: UIPanGestureRecognizer) {
        if let panView = pan.view {
            let trans = pan.translationInView(panView)
            let touchPoint = pan.locationInView(panView.superview)
            
            switch pan.state {
            case .Began:
                dragStart = panView.center
                panView.layer.setValue(panView.layer.zPosition, forKey: zPositionKey)
                panView.layer.zPosition = CGFloat(Int.max)
                tellDelegate(didBeginDragging, panView, touchPoint)
                
                /* Can't do this in init() because didCompleteDrop (all functions, in fact)
                are nil, so doing it here instead. */
                if let dCD = dropController.didCompleteDrop {
                    dropController.didCompleteDrop = didDrop
                }
                
            case .Changed:
                panView.center = _G.point(dragStart.x + trans.x, dragStart.y + trans.y)
                tellDelegate(didDrag, panView, touchPoint)
                
            case .Ended:
                panView.layer.zPosition = panView.layer.valueForKey(zPositionKey) as CGFloat
                tellDelegate(didEndDragging, panView, touchPoint)
                
            default: nothing()
            }
        }
    }
    
    // MARK: Delegate Notification
    func tellDelegate(method: ((UIView, CGPoint)->Void)?, _ view: UIView, _ touchPoint: CGPoint) {
        if let m = method {m(view, touchPoint)}
    }
    func tellDropDelegate(method: ((UIView, DropTargetView)->Void)?, _ view: UIView, _ target: DropTargetView) {
        if let m = method {m(view, target)}
    }
    
    public var dropController: DropController!
    
    var dragStart: CGPoint = CGPointZero
    let zPositionKey = "zPositionKey"
}