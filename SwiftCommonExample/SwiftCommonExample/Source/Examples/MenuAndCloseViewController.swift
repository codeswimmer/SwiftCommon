//
//  MenuAndCloseViewController.swift
//  SwiftCommonExample
//
//  Created by Keith Ermel on 9/27/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit
import SwiftCommon


class MenuAndCloseViewController: UIViewController {

    // MARK: Animations
    func expandMenuAndCloseView() {
        
        removeWidthAndHeightConstraints()
        expandToFullSize()
        
        UIView.animateWithDuration(0.3, animations: {
            self.expandableView.layoutIfNeeded()
            self.expandableView.backgroundColor = UIColor.darkGray(0.5)
        })
    }
    
    func collapseExpandableView() {
        restoreWidthAndHeightConstraints()
        
        UIView.animateWithDuration(0.3, animations: {
            self.expandableView.layoutIfNeeded()
            self.expandableView.backgroundColor = UIColor.lightGray(0.1)
        })
    }
    
    // MARK: Internal API
    func removeWidthAndHeightConstraints() {
        orig = Orig(w: expandlableWidthConstraint, h: expandableHeightConstraint)
        expandableView.removeConstraints(orig!.constraints)
    }
    
    func restoreWidthAndHeightConstraints() {
        if let x = expanded {view.removeConstraints(x)}
        if let o = orig {expandableView.addConstraints(o.constraints)}
    }
    
    func expandToFullSize() {
        let leading = _C.leading(expandableView, toItem: view, amount: 16.0)
        let bottom = _C.bottom(expandableView, toItem: view, amount: -16.0)
        expanded = [leading, bottom]
        view.addConstraints(expanded!)
    }
    
    // MARK: Configuration
    func configureMenuAndCloseView() {
        menuAndCloseView.roundedCorners(5.0)
        menuAndCloseView.didActivate = {
            switch self.menuAndCloseView.state {
            case .Menu: self.expandMenuAndCloseView()
            case .Close: self.collapseExpandableView()
            }
        }
    }
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        let options = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSShadowAttributeName: UIColor.darkGrayColor()]
        UINavigationBar.appearance().titleTextAttributes = options
        
        expandableView.roundedCorners(8.0)
        expandableView.backgroundColor = UIColor.lightGray(0.1)
        
        configureMenuAndCloseView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        navigationController?.navigationBar.backItem?.title = ""
    }
    
    struct Orig {
        init(w: NSLayoutConstraint, h: NSLayoutConstraint) {width = w; height = h}
        var constraints: [NSLayoutConstraint] {return [width, height]}
        let width: NSLayoutConstraint
        let height: NSLayoutConstraint
    }

    // MARK: Variables
    var orig: Orig?
    var expanded: [NSLayoutConstraint]?
    
    // MARK: Outlets
    @IBOutlet weak var menuAndCloseView: MenuAndCloseTransitionView!
    @IBOutlet weak var expandableView: UIView!
    @IBOutlet weak var expandableHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var expandlableWidthConstraint: NSLayoutConstraint!
}
