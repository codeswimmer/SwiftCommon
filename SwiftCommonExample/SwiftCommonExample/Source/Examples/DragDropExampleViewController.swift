//
//  DragDropExampleViewController.swift
//  SwiftCommonExample
//
//  Created by Keith Ermel on 7/23/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit
import SwiftCommon

class DragDropExampleViewController: UIViewController {
    
    // MARK: ViewDragger Delegate
    func didDrop(view: UIView, target: DropTargetView) {
        println("didDrop: \(view.layer.name) on \(target.layer.name)")
        
        if target.layer.name == "dropViewA" {self.view.backgroundColor = view.backgroundColor}
        else if target.layer.name == "dropViewB" {target.backgroundColor = view.backgroundColor}
    }
    
    // MARK: Configuration
    func configureDragDropExample() {
        let dropViewA = DropTargetView(frame: _G.rect(150.0, 100.0, 100.0, 100.0))
        dropViewA.backgroundColor = UIColor.grayColor(0.75, alpha: 0.8)
        dropViewA.borderOn(UIColor.lightGrayColor(), 3.0)
        dropViewA.layer.name = "dropViewA"
        self.view.addSubview(dropViewA)
        
        viewDragger = ViewDragger(draggedView: dropViewA)
        viewDragger!.didDrop = didDrop
        viewDragger!.dropController?.addDropTarget(dropViewA)
        
//        let dropViewB = DropTargetView(frame: _G.rect(150.0, 225.0, 100.0, 100.0))
        let dropViewB = DropTargetView(frame: _G.rectFrom(dropViewA.frame, withY:225.0))
        dropViewB.backgroundColor = UIColor.grayColor(0.50, alpha: 0.8)
        dropViewB.borderOn(UIColor.lightGrayColor(), 3.0)
        dropViewB.layer.name = "dropViewB"
        self.view.addSubview(dropViewB)
        viewDragger!.dropController?.addDropTarget(dropViewB)
        viewDragger?.addView(dropViewB)
        
        let viewB = UIView(frame: _G.rect(20.0, 75.0, 50.0, 50.0))
        viewB.backgroundColor = UIColor.colorWithRGB(192, 0, 0, 0.75)
        viewB.borderOn(UIColor.lightGrayColor(), 1.0)
        viewB.layer.name = "redView"
        self.view.addSubview(viewB)
        viewDragger?.addView(viewB)
        
        let viewC = UIView(frame: _G.rect(30.0, 150.0, 50.0, 50.0))
        viewC.backgroundColor = UIColor.colorWithRGB(0, 128, 0, 0.5)
        viewC.borderOn(UIColor.lightGrayColor(), 1.0)
        viewC.layer.name = "greenView"
        self.view.addSubview(viewC)
        viewDragger?.addView(viewC)
        
        let viewD = UIView(frame: _G.rect(40.0, 220.0, 50.0, 50.0))
        viewD.backgroundColor = UIColor.colorWithRGB(0, 75, 192, 0.5)
        viewD.borderOn(UIColor.lightGrayColor(), 1.0)
        viewD.layer.name = "blueView"
        self.view.addSubview(viewD)
        viewDragger?.addView(viewD)
    }
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDragDropExample();
    }
    
    var viewDragger: ViewDragger?
}
