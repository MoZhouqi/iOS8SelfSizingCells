//
//  DetailViewController.swift
//  iOS8SelfSizingCells
//
//  Created by Zhouqi Mo on 1/28/15.
//  Copyright (c) 2015 Zhouqi Mo. All rights reserved.
//

import UIKit

enum KMDetailViewType: String {
    case Issue = "Issue"
    case Workaround = "Workaround"
}

class DetailViewController: UITableViewController {
    
    var detailViewType: KMDetailViewType = .Issue {
        didSet {
            title = detailViewType.rawValue
        }
    }
    
    struct Constants {
        struct TableViewCell {
            static let identifier = "Cell"
        }
    }
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let svc = splitViewController {
            navigationItem.leftBarButtonItem = svc.displayModeButtonItem()
            navigationItem.leftItemsSupplementBackButton = true
        }
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
        
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.identifier, forIndexPath: indexPath) as KMTableViewCell
        
        cell.updateFonts()
        
        if detailViewType == .Workaround {
            cell.tableView = self.tableView
            cell.titleLabel.preferredMaxLayoutWidth = cell.maxLayoutWidth
        }
        
        let text = "This is a text message to reproduce the problem!"
        cell.titleLabel.text = text
        
        return cell
    }
    
}
