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
        titleLabel.l
    }
    
}

class KMWorkAroundTableViewCell: KMTableViewCell {
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    
    var maxLayoutWidth: CGFloat {
        let DetailAccessoryWidth: CGFloat = 47.0
        let maxWidth = CGRectGetWidth(UIApplication.sharedApplication().keyWindow!.frame)
        
        // Minus the left/right padding for the label
        let maxLayoutWidth = maxWidth - leadingConstraint.constant - trailingConstraint.constant - DetailAccessoryWidth
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


