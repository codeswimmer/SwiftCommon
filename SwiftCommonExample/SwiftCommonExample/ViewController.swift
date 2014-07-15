//
//  ViewController.swift
//  SwiftCommonExample
//
//  Created by Keith Ermel on 7/13/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit
import SwiftCommon

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dropViewA = DropTargetView(frame: _G.rect(150.0, 100.0, 100.0, 100.0))
        dropViewA.backgroundColor = UIColor.grayColor(0.75, alpha: 0.8)
        dropViewA.borderOn(UIColor.lightGrayColor(), 3.0)
        dropViewA.layer.setValue("dropViewA", forKey: nameKey)
        self.view.addSubview(dropViewA)

        viewDragger = ViewDragger(draggedView: dropViewA)
        viewDragger!.dropController?.addDropTarget(dropViewA)

        let dropViewB = DropTargetView(frame: _G.rect(150.0, 225.0, 100.0, 100.0))
        dropViewB.backgroundColor = UIColor.grayColor(0.50, alpha: 0.8)
        dropViewB.borderOn(UIColor.lightGrayColor(), 3.0)
        dropViewB.layer.setValue("dropViewB", forKey: nameKey)
        self.view.addSubview(dropViewB)
        viewDragger!.dropController?.addDropTarget(dropViewB)
        viewDragger?.addView(dropViewB)
        
        let viewB = UIView(frame: _G.rect(20.0, 50.0, 50.0, 50.0))
        viewB.backgroundColor = UIColor.colorWithRGB(192, 0, 0, 0.75)
        viewB.borderOn(UIColor.lightGrayColor(), 1.0)
        viewB.layer.setValue("redView", forKey: nameKey)
        self.view.addSubview(viewB)
        viewDragger?.addView(viewB)
        
        let viewC = UIView(frame: _G.rect(30.0, 110.0, 50.0, 50.0))
        viewC.backgroundColor = UIColor.colorWithRGB(0, 128, 0, 0.5)
        viewC.borderOn(UIColor.lightGrayColor(), 1.0)
        viewC.layer.setValue("greenView", forKey: nameKey)
        self.view.addSubview(viewC)
        viewDragger?.addView(viewC)
        
        let viewD = UIView(frame: _G.rect(40.0, 170.0, 50.0, 50.0))
        viewD.backgroundColor = UIColor.colorWithRGB(0, 75, 192, 0.5)
        viewD.borderOn(UIColor.lightGrayColor(), 1.0)
        viewD.layer.setValue("blueView", forKey: nameKey)
        self.view.addSubview(viewD)
        viewDragger?.addView(viewD)
    }
    
    var viewDragger: ViewDragger?
    
    // TODO: These are also defined in SwiftCommon; 
    // need to remove these & reference those instead
    let nameKey = "name"
    let origBorderColorKey = "origBorderColor"
}
