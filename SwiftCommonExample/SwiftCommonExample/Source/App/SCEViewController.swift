//
//  SCEViewController.swift
//  SwiftCommonExample
//
//  Created by Keith Ermel on 7/13/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit
import SwiftCommon

class SCEViewController: UIViewController {

    // MARK: Internal API
    func listVC(task: (UITableViewController)->Void) {if let listVC = examplesListVC {task(listVC)}}
    
    // MARK: Configuration
    func configureListVC(segue: UIStoryboardSegue) {
        examplesListVC = segue.destinationViewController as? UITableViewController
        listVC {vc in
            vc.tableView.contentInset = UIEdgeInsetsMake(30.0, 0.0, 0.0, 0.0)
            vc.tableView.backgroundColor = UIColor.darkGrayColor()
            vc.tableView.hideEmptyCells()
        }
    }
    
    // MARK: Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "examplesListSegue" {configureListVC(segue)}
    }
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let direction = Direction.Center;
        println("direction: \(direction.description())")
    }

    // MARK: Variables
    var examplesListVC: UITableViewController?
    
    // MARK: Outlets
    @IBOutlet weak var examplesListContainer: UIView!
}
