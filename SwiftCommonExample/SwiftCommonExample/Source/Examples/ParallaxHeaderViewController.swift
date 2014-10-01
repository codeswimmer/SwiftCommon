//
//  ParallaxHeaderViewController.swift
//  SwiftCommonExample
//
//  Created by Keith Ermel on 9/30/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit

class ParallaxHeaderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBarHidden = true
    }
    

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        view.logViewHierarchy()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "parallaxHeaderTableSegue" {
            tableVC = segue.destinationViewController as? ParallaxHeaderTableViewController
            if let vc = tableVC {vc.items = ["red", "orange", "yellow", "green", "blue", "purple"]}
        }
    }
    
    var tableVC: ParallaxHeaderTableViewController? = nil
}
