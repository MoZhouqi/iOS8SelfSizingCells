iOS8SelfSizingCells
============

An example of `Self Sizing Cells` that is introduced in iOS 8 using Auto Layouts and the workaround for incorrect automatically computing `preferredMaxLayoutWidth` of UILabel.

##Introduction

In iOS 6, Apple added `preferredMaxLayoutWidth` property to UILabel that greatly simplifies dynamic vertical resizing of labels.

With iOS 7, Apple introduced a system called `Dynamic Type` that allows users to specify a preferred reading size for text.

Apple added support for automatically computing `preferredMaxLayoutWidth` of UILabel at runtime when set the property to `Automatic` in Interface Builder, which makes creating multiline labels even easier in iOS 8. 

And also in iOS 8, Apple introduced a new feature for UITableView known as `Self Sizing Cells` which provides a solution for displaying dynamic content and calculating the height of each cell at runtime.

All features described above is intended to facilitate and improve the use of Auto Layout.

##Issue

![Screenshot](https://raw.githubusercontent.com/MoZhouqi/iOS8SelfSizingCells/master/Gif/Screenshot.gif)

Unfortunately, they don't seem to be working perfectly when uses the features introduced above. There are no multiline labels!

But scrolling the tableView down and back to reuse the cells or change the tableView's size to re-layout the subViews causes them to be redisplayed correctly.

The cause of the problem is the `preferredMaxLayoutWidth` property of the UILabel is not automatically calculated correctly. 

##WorkAround

The workaround is to manually set the `preferredMaxLayoutWidth` on the label based on its actual width. See `KMTableViewCell.swift` and `DetailViewController.swift`

```swift
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

    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.preferredMaxLayoutWidth = maxLayoutWidth
    }
}
  
class DetailViewController: UITableViewController {
    ......  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableViewCell.identifier, forIndexPath: indexPath) as KMTableViewCell
        cell.tableView = self.tableView
        cell.titleLabel.preferredMaxLayoutWidth = cell.maxLayoutWidth
        ......
        return cell
    }
    ......
}
```
