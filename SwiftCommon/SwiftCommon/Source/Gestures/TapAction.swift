//
//  TapAction.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 9/14/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit


public class TapAction: GestureAction {
    
    // MARK: Internal Required API
    override func configureGesture(actionSelector: Selector) -> UIGestureRecognizer? {
        tapGesture = UITapGestureRecognizer(target: self, action: actionSelector)
        return tapGesture
    }
    
    // MARK: Initialization
    public override init(view: UIView, task: GestureTask) {super.init(view: view, task: task);}
    
    // MARK: Variables
    public var tapGesture: UITapGestureRecognizer? = nil
}
