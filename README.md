iOS8SelfSizingCells
============

An example of `Self Sizing Cells` that is introduced in iOS 8 using Auto Layouts and the workaround for incorrect automatically computing `preferredMaxLayoutWidth` of UILabel.

##Introduction

In iOS 6, Apple added `preferredMaxLayoutWidth` property to UILabel that greatly simplifies dynamic vertical resizing of labels.

With iOS 7, Apple introduced a system called `Dynamic Type` that allows users to specify a preferred reading size for text.

Apple added support for automatically computing `preferredMaxLayoutWidth` of UILabel at runtime when set the property to `Automatic` in Interface Builder, which makes creating multiline labels even easier in iOS 8. 

And also in iOS 8, Apple introduced a new feature for UITableView known as `Self Sizing Cells` which provides a solution for displaying dynamic content and calculating the height of each cell at runtime.

All features described above is to facilitate and enhance the use of Auto Layout.

##Issue
<img src="https://raw.githubusercontent.com/MoZhouqi/iOS8SelfSizingCells/master/Screenshots/Issue.png" width="355"/>
<img src="https://raw.githubusercontent.com/MoZhouqi/iOS8SelfSizingCells/master/Screenshots/Workaround.png" width="355"/>

Unfortunately, they don't seem to be working perfectly when uses the features introduced above. There is no multiline labels!

But Scrolling the table down and back to reuse the cells or rotate the screen to landscape and then rotate back to portrait causes them to be redisplayed correctly.

The cause of the problem is the `preferredMaxLayoutWidth` property of the UILabel is not automatically calculated correctly. 


##WorkAround
The workaround is to manually set the `preferredMaxLayoutWidth` on the label based on its actual width. See `KMTableViewCell.swift`
```
class KMTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
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
```
