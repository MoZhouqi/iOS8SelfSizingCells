//
//  KMTableViewCell.swift
//  iOS8SelfSizingCells
//
//  Created by Zhouqi Mo on 1/28/15.
//  Copyright (c) 2015 Zhouqi Mo. All rights reserved.
//

import UIKit


enum KMTableViewCellStyle: String {
    case Issue = "Issue Cell"
    case Workaround = "Workaround Cell"
}

class KMTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateFonts()
    }
    
    func updateFonts()
    {
        titleLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
    }
    
}

class KMWorkAroundTableViewCell: KMTableViewCell {
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    
    var maxLayoutWidth: CGFloat {
        
        // So weird! the value is 47.0 in IB, but it is actually 48.0.
        let CellTrailingToContentViewTrailingConstant: CGFloat = 48.0
        let maxWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow!.frame)
        
        // Minus the left/right padding for the label
        let maxLayoutWidth = maxWidth - leadingConstraint.constant - trailingConstraint.constant - CellTrailingToContentViewTrailingConstant
        return maxLayoutWidth
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.preferredMaxLayoutWidth = maxLayoutWidth
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.preferredMaxLayoutWidth = maxLayoutWidth
    }
    
}


