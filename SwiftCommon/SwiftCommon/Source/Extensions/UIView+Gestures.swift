//
//  UIView(Gestures).swift
//  MockerUI
//
//  Created by Keith Ermel on 7/3/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

extension UIView {
    func didTap(sender: UITapGestureRecognizer) {
        let touchPoint = sender.locationInView(self)
        onTapped(sender, touchPoint: touchPoint)
    }
    
    func didPinch(sender: UIPinchGestureRecognizer) {
        let touchPoint = sender.locationInView(self)
        onPinched(sender, touchPoint: touchPoint)
    }
    
    // MARK: Subclasses can override these
    func onTapped(sender: UITapGestureRecognizer, touchPoint: CGPoint){}
    func onPinched(sender: UIPinchGestureRecognizer, touchPoint: CGPoint){}
    
    func configureTapGesture() -> UIView {addTapHandler("didTap:"); return self}
    func configurePinchGesture() -> UIView {addPinchHandler("didPinch:"); return self}
    
    func addTapHandler(action: Selector) -> UITapGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self, action: action)
        addGestureRecognizer(tap)
        return tap
    }
    
    func addTapHandler(target: AnyObject!, action: Selector) -> UITapGestureRecognizer {
        let tap = UITapGestureRecognizer(target: target, action: action)
        addGestureRecognizer(tap)
        return tap
    }
    
    func addPinchHandler(action: Selector) -> UIPinchGestureRecognizer {
        let pinch = UIPinchGestureRecognizer(target: self, action: action)
        addGestureRecognizer(pinch)
        return pinch
    }
}
