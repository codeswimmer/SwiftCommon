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
        
        let viewA = _V.fixedSizeView(_G.size(100.0, 100.0))
        viewA.backgroundColor = UIColor.grayColor(0.75, alpha: 0.8)
        viewA.borderOn(UIColor.lightGrayColor(), 1.0)
        viewA.layer.setValue("grayView", forKey: nameKey)
        self.view.addSubview(viewA)
        self.view.addConstraints(_C.centered(viewA, toItem: self.view))

        viewDragger = ViewDragger(draggedView: viewA)
        
        let viewB = UIView(frame: _G.rect(20.0, 50.0, 50.0, 50.0))
        viewB.backgroundColor = UIColor.colorWithRGB(192, 0, 0, 0.75)
        viewB.borderOn(UIColor.lightGrayColor(), 1.0)
        viewB.layer.setValue("redView", forKey: nameKey)
        self.view.addSubview(viewB)
        viewDragger?.addView(viewB)
        
        let viewC = UIView(frame: _G.rect(30.0, 60.0, 50.0, 50.0))
        viewC.backgroundColor = UIColor.colorWithRGB(0, 128, 0, 0.5)
        viewC.borderOn(UIColor.lightGrayColor(), 1.0)
        viewC.layer.setValue("redView", forKey: nameKey)
        self.view.addSubview(viewC)
        viewDragger?.addView(viewC)
        
        let viewD = UIView(frame: _G.rect(40.0, 70.0, 50.0, 50.0))
        viewD.backgroundColor = UIColor.colorWithRGB(0, 75, 192, 0.5)
        viewD.borderOn(UIColor.lightGrayColor(), 1.0)
        viewD.layer.setValue("redView", forKey: nameKey)
        self.view.addSubview(viewD)
        viewDragger?.addView(viewD)
        
        self.view.forEachSubview {view in
            println("\(view.tag) - \(view.layer.zPosition)")
        }
        
//        viewDragger!.didBeginDragging = didBeginDragging
//        viewDragger!.didDrag = didDrag
//        viewDragger!.didEndDragging = didEndDragging
    }
    
    func didBeginDragging(view: UIView) {
        println("did begin: \(view.layer.valueForKey(nameKey)) [\(view.center)]")
    }
    
    func didDrag(view: UIView) {
        println("did drag: \(view.layer.valueForKey(nameKey)) [\(view.center)]")
    }
    
    func didEndDragging(view: UIView) {
        println("did end: \(view.layer.valueForKey(nameKey)) [\(view.center)]")
    }
    
    var viewDragger: ViewDragger?
    let nameKey = "name"
}
