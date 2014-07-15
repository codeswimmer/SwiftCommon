//
//  ViewDragger.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/13/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

protocol DropTarget {
    // Began
    
    // Moved
    
    // Ended
    func canAcceptDropOfView(view: UIView) -> Bool
    func willAcceptDropOfView(view: UIView) -> Bool
}

class DropTargetView: UIView, DropTarget {
    
    func hitTestDraggedView(view: UIView) -> Bool {
        if view == self {return false}
        
        if self.frame.contains(view.frame) {highlight(); return true}
        else {unhilight()}
        
        return false
    }
    
    func canAcceptDropOfView(view: UIView) -> Bool {return true}
    func willAcceptDropOfView(view: UIView) -> Bool {return true}
    
    func highlight() {
        if let value: AnyObject = self.layer.valueForKey(origBorderColorKey) {return}
        
        let borderColor = UIColor(CGColor: self.layer.borderColor)
        self.layer.setValue(borderColor, forKey: origBorderColorKey)
        self.layer.borderColor = borderHighlightColor.CGColor
        
        let bgColor = UIColor(CGColor: self.layer.backgroundColor)
        self.layer.setValue(backgroundColor, forKey: origBackgroundColorKey)
        self.layer.backgroundColor = backgroundHighlightColor.CGColor
    }
    
    func unhilight() {
        if let value: AnyObject = self.layer.valueForKey(origBorderColorKey) {
            if let color = value as? UIColor {
                self.layer.borderColor = color.CGColor
                self.layer.setValue(nil, forKey: origBorderColorKey)
            }
        }
        if let value: AnyObject = self.layer.valueForKey(origBackgroundColorKey) {
            if let color = value as? UIColor {
                self.layer.backgroundColor = color.CGColor
                self.layer.setValue(nil, forKey: origBackgroundColorKey)
            }
        }
    }
    
    var borderHighlightColor = UIColor.colorWithRGB(192, 0, 0, 0.75)
    var backgroundHighlightColor = UIColor.colorWithRGB(253, 176, 104, 0.75)
    
    let nameKey = "name"
    let origBorderColorKey = "origBorderColor"
    let origBackgroundColorKey = "origBackgroundColor"
    let hasEnteredKey = "hasEntered"
}

class DropController {
    
    init(dragger: ViewDragger) {
        dragger.didBeginDragging = didBeginDragging
        dragger.didDrag = didDrag
        dragger.didEndDragging = didEndDragging
    }
    
    func addDropTarget(dropTarget: DropTargetView) {
        dropTargets.append(dropTarget)
    }
    
    func removeDropTarget(dropTarget: DropTargetView) {
        dropTargets.remove(dropTarget)
    }
    
    // MARK: ViewDragger Delegate
    func didBeginDragging(view: UIView, touchPoint: CGPoint) {
    }
    
    
    var activeDropTarget: DropTargetView?
    
    func didDrag(view: UIView, touchPoint: CGPoint) {
        for dropTarget in dropTargets {
            if dropTarget.hitTestDraggedView(view) {if activeDropTarget == nil {activeDropTarget = dropTarget}}
            else {if let active = activeDropTarget {if active == dropTarget {activeDropTarget = nil}}}
        }
    }
    
    func didEndDragging(view: UIView, touchPoint: CGPoint) {
        for dropTarget in dropTargets {
            if dropTarget.canAcceptDropOfView(view) {
                //
            }
        }
    }
    
    // MARK: Delegate Notification
    func tellDelegate(method: ((UIView)->Void)?, _ dropTarget: UIView) {if let m = method {m(dropTarget)}}
    
    var draggableViews =  [UIView]()
    var dropTargets = [DropTargetView]()
    var lastDropTarget: UIView?
    let nameKey = "name"
    
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