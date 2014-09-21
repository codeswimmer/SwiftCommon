//
//  TapAction.swift
//  SwiftCommon
//
//  Created by Keith Ermel on 9/14/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit


public class TapAction: GestureAction {

    // MARK: Public API
    public class func attachToView(view: UIView, task: GestureTask) {
        let tapAction = TapAction(view: view, task: task)
        view.layer.setValue(tapAction, forKey: "tap.action")
    }
    
    // MARK: Internal Required API
    override func configureGesture(actionSelector: Selector) -> UIGestureRecognizer? {
        tapGesture = UITapGestureRecognizer(target: self, action: actionSelector)
        return tapGesture
    }
    
    // MARK: Initialization
    public override init(view: UIView, task: GestureTask) {
        super.init(view: view, task: task)
    }
    
    // MARK: Variables
    public var tapGesture: UITapGestureRecognizer? = nil
}
