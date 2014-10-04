//
//  LabelSlideViewController.swift
//  SwiftCommonExample
//
//  Created by Keith Ermel on 10/4/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit
import SwiftCommon

class LabelSlideViewController: UIViewController {

    // MARK: Animations
    private func slideIntroLabelOnscreen() {
        func adjustConstraints(labelBox: UIView) {
            labelBox.alpha = 1.0
            labelBox.moveToCenter()
            
            if let wc = labelBox.findConstraint(.Width) {
                labelBox.removeConstraint(wc)
                
                if let cc = self.view.findConstraint(.CenterX) {
                    self.view.removeConstraint(cc)
                    
                    let leading = _C.leading(labelBox, toItem: self.view, amount: self.labelPad)
                    let trailing = _C.trailing(labelBox, toItem: self.view, amount: -self.labelPad)
                    self.view.addConstraints([leading, trailing])
                }
            }
        }
        
        if let labelBox = view.viewWithTag(Tags.labelBox.toRaw()) {
            labelBox.backgroundColor = UIColor.black(0.0)

            let bringOnScreen = adjustConstraints
            let slideOffscreen = self.slideIntroLabelOffscreen
            labelBox.animateConstraint(0.3,
                 animation: {bringOnScreen(labelBox)},
                completion: {x in slideOffscreen(.Left)})
        }
    }
    
    private func slideIntroLabelOffscreen(direction: Direction) {
        if let labelBox = view.viewWithTag(Tags.labelBox.toRaw()) {
            labelBox.backgroundColor = UIColor.black(0.0)

            GCD.performWithDelayMillis(400) {
                if let label = labelBox.viewWithTag(Tags.label.toRaw()) as? UILabel {label.text = "Goodbye"}}
            UIView.animateWithDuration(0.2,
                     delay: 0.5,
                   options:UIViewAnimationOptions.CurveEaseOut,
                animations: {labelBox.center = _G.point(labelBox.center.x + self.view.bounds.width, labelBox.center.y)},
                completion: {x in labelBox.removeFromSuperview()})
        }
    }
    
    // MARK: Configuration
    private func configureIntroLabel() {
        let boxSize = (view.bounds.width - (labelPad * 2.0), CGFloat(50.0))
        let labelSize = _G.size(boxSize.0, boxSize.1)
        
        ViewBuilder
            .box(boxSize)
            .tag(Tags.labelBox.toRaw())
            .color(UIColor.black(0.5))
            .roundedCorners(5.0)
            .centeredIn(view)
            .addChild {parentView in
                let label = UILabel.Builder
                    .start(labelSize)
                    .text("Hello")
                    .textColor(UIColor.whiteColor())
                    .font(UIFont(name: "AvenirNext-Bold", size: 14.0)).label!
                
                label.tag = Tags.label.toRaw()
                label.setName("label")
                
                return label
            }
            .additions {builder, box in
                box.moveOffscreenLeft()
                box.alpha = 0.0
                box.setName("labelBox")
                
                self.view.logViewHierarchy()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureIntroLabel()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        view.fadeBackgroundToColor(0.5, color: UIColor.darkGrayColor())
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        slideIntroLabelOnscreen()
    }

    private enum Tags: Int {
        case labelBox = 100
        case label = 200
    }

    private let labelPad: CGFloat = 16.0
}
