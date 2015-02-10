//
//  KMTableViewCell.swift
//  iOS8SelfSizingCells
//
//  Created by Zhouqi Mo on 1/28/15.
//  Copyright (c) 2015 Zhouqi Mo. All rights reserved.
//

import UIKit

class KMTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    
    var tableView: UIView!
    var maxLayoutWidth: CGFloat {
        // So weird! The value is 47.0 in IB, but it is actually 48.0.
        let CellTrailingToContentViewTrailingConstant: CGFloat = 48.0
        
        // Minus the left/right padding for the label
        let maxLayoutWidth = CGRectGetWidth(tableView.frame) - leadingConstraint.constant - trailingConstraint.constant - CellTrailingToContentViewTrailingConstant
        return maxLayoutWidth
    }
    
    func updateFonts()
    {
        titleLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if tableView != nil {
            titleLabel.preferredMaxLayoutWidth = maxLayoutWidth
        }
    }
    
}


