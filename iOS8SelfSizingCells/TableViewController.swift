//
//  TableViewController.swift
//  maxwidth
//
//  Created by Zhouqi Mo on 1/28/15.
//  Copyright (c) 2015 Zhouqi Mo. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var tableViewCellStyle: KMTableViewCellStyle = .Issue {
        willSet {
            switch newValue {
            case .Issue:
                title = "Issue"
            case .Workaround:
                title = "Workaround"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50.0
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(
            tableViewCellStyle.rawValue, forIndexPath: indexPath) as KMTableViewCell
        
        cell.updateFonts()
        
        let text = "This is a text message for reproduce the issue!"
        cell.titleLabel.text = text
        
        return cell
    }
  
}
