//
//  RootViewController.swift
//  maxwidth
//
//  Created by Zhouqi Mo on 1/28/15.
//  Copyright (c) 2015 Zhouqi Mo. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50.0
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let viewController = segue.destinationViewController as? TableViewController {
            
            viewController.tableViewCellStyle = (tableView.indexPathForSelectedRow()?.row == 0) ? .Issue : .Workaround
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

}
