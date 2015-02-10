//
//  MasterViewController.swift
//  iOS8SelfSizingCells
//
//  Created by Zhouqi Mo on 1/28/15.
//  Copyright (c) 2015 Zhouqi Mo. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50.0
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Show Detail" {
            if let detailViewController = segue.destinationViewController.topViewController as? DetailViewController {
                detailViewController.detailViewType = (tableView.indexPathForSelectedRow()?.row == 0) ? .Issue : .Workaround
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        switch indexPath.row {
        case 0:
            cell.textLabel!.text = "Issue"
        case 1:
            cell.textLabel!.text = "Workaround"
        default:
            break
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}
