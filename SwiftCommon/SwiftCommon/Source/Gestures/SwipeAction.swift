//
//  SwipeAction.swift
//  Artwork
//
//  Created by Keith Ermel on 8/28/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit


public class SwipeAction: GestureAction {

    // MARK: Internal Required API
    override func configureGesture(actionSelector: Selector) -> UIGestureRecognizer? {
        swipeGesture = UISwipeGestureRecognizer(target: self, action: actionSelector)
        return swipeGesture
    }
    
    // MARK: Initialization
    public override init(view: UIView, task: GestureTask) {super.init(view: view, task: task);}
    
    // MARK: Variables
    public var swipeGesture: UISwipeGestureRecognizer? = nil
}
