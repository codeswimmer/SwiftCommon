//
//  ParallaxHeaderTableViewController.swift
//  SwiftCommonExample
//
//  Created by Keith Ermel on 9/30/14.
//  Copyright (c) 2014 Keith Ermel. All rights reserved.
//

import UIKit
import SwiftCommon


class ParallaxHeaderTableViewController: UITableViewController {

    var items: [String]?
    var parallaxView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor.purpleColor()
        tableView.rowHeight = 50.0
        tableView.hideEmptyCells()
        
//        tableView.tableHeaderView = ViewBuilder
//            .box((tableView.bounds.width, 50.0))
//            .color(UIColor.blackColor()).view

        parallaxView = ViewBuilder.box((320.0, 350.0)).color(UIColor.redColor()).view
        println("parallaxView: \(parallaxView!.frame)")
        tableView.insertSubview(parallaxView!, atIndex: 0)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        tableView.contentInset = UIEdgeInsetsZero
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    // MARK: UIScrollViewDelegate
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        if let headerView = tableView.tableHeaderView {
            let b = headerView.bounds
            let origin = CGPointMake(b.origin.x, max(0, min(CGRectGetHeight(b), tableView.contentOffset.y)))
            
//            let y = min(max(abs(tableView.contentOffset.y), 50.0), 250.0)
//            headerView.frame = _G.rectFrom(headerView.frame, withHeight: abs(y) + 50.0)
//            println(">>> y: \(y)); frame: \(headerView.frame);  \(tableView.contentOffset); \(tableView.contentSize)")
        }
    }

    // MARK: - UITableViewDataSource
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let model = items {return model.count}
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ParallaxCell", forIndexPath: indexPath) as UITableViewCell

        if let model = items {
            if let label = cell.viewWithTag(Tags.nameLabel.toRaw()) as? UILabel {label.text = model[indexPath.row]}
        }
        return cell
    }
    
    enum Tags: Int {
        case nameLabel = 100
    }
}
