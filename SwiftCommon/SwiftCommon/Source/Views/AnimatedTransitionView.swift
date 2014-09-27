//
//  AnimatedTransitionView.swift
//  MenuToCloseSpike
//
//  Created by Keith Ermel on 9/27/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit


public class AnimatedTransitionView: UIView {
    
    // MARK: Delegate Ports
    public var didActivate: (()->Void)? = nil

    // MARK: Internal API
    func performAnimation() {}
    
    // MARK: Gestures
    func didTap() {
        performAnimation()
        if let activated = didActivate {activated()}
    }
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        tapAction = TapAction(view: self, didTap)
    }
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        tapAction = TapAction(view: self, didTap)
    }

    // MARK: Constants
    let tapAction: TapAction!
}
