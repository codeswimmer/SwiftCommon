//
//  UIViewController+Gestures.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 7/1/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func addTapHandler(action: Selector) -> UITapGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self, action: action)
        self.view.addGestureRecognizer(tap)
        return tap
    }
    
    func addTapHandler(action: Selector, toView: UIView) -> UITapGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self, action: action)
        toView.addGestureRecognizer(tap)
        return tap
    }
    
    func addPanHandler(action: Selector, toView: UIView) -> UIPanGestureRecognizer {
        let pan = UIPanGestureRecognizer(target: self, action: action)
        toView.addGestureRecognizer(pan)
        return pan
    }
    
    func addLongPressHandler(action: Selector) -> UILongPressGestureRecognizer {
        let longPress = UILongPressGestureRecognizer(target: self, action: action)
        self.view.addGestureRecognizer(longPress)
        return longPress
    }
    
    func addSwipeHandler(direction: UISwipeGestureRecognizerDirection, action: Selector) -> UISwipeGestureRecognizer {
        let swipe = UISwipeGestureRecognizer(target: self, action: action)
        swipe.direction = direction
        self.view.addGestureRecognizer(swipe)
        return swipe
    }
    
    func addSwipeUpHandler(action: Selector) -> UISwipeGestureRecognizer {
        return addSwipeHandler(UISwipeGestureRecognizerDirection.Up, action: action)
    }
    
    func addSwipeDownHandler(action: Selector) -> UISwipeGestureRecognizer {
        return addSwipeHandler(UISwipeGestureRecognizerDirection.Down, action: action)
    }
    
    func addSwipeLeftHandler(action: Selector) -> UISwipeGestureRecognizer {
        return addSwipeHandler(UISwipeGestureRecognizerDirection.Left, action: action)
    }
    
    func addSwipeRightHandler(action: Selector) -> UISwipeGestureRecognizer {
        return addSwipeHandler(UISwipeGestureRecognizerDirection.Right, action: action)
    }
}
