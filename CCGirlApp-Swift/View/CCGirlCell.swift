//
//  CCGirlCell.swift
//  CCFunnyClient-Swift
//
//  Created by CocoaChen on 14-7-19.
//  Copyright (c) 2014 CocoaChen. All rights reserved.
//

import UIKit

class CCGirlCell: UITableViewCell {

    var screenWidth = UIScreen.mainScreen().bounds.size.width
    var titleLabel : UILabel?
    var girlImageView : UIImageView?
    
    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
        titleLabel = UILabel(frame: CGRectMake(10, 10, screenWidth - 20, 0))
        titleLabel!.backgroundColor = UIColor.clearColor()
        titleLabel!.textColor = UIColor(red: 138.0/255.0, green: 138.0/255.0, blue: 138.0/255.0, alpha: 1.0)
        titleLabel!.font = UIFont.systemFontOfSize(16)
        titleLabel!.numberOfLines = 0;
        titleLabel!.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.contentView!.addSubview(titleLabel)
        
        girlImageView = UIImageView(frame: CGRectMake(0, 0, screenWidth, 0))
        girlImageView!.backgroundColor = UIColor(red: 219.0/255.0, green: 220.0/255.0, blue: 221.0/255.0, alpha: 1.0)
        self.contentView!.addSubview(girlImageView)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    class func heightForCell(girl: CCGirl!) -> CGFloat {
        var width = UIScreen.mainScreen().bounds.size.width

        var titleHeight : CGFloat
        if (girl.imageTitle.length > 0){
            titleHeight = UILabel.heightForLabel(girl.imageTitle, maxWidth: width - 20, font: UIFont.systemFontOfSize(16), lineBreakMode: .ByWordWrapping)
        }else{
            titleHeight = 0;
        }
        var picHeight : CGFloat
        if girl.imageWidth <= 0 {
            picHeight = 0;
        }else {
            picHeight = girl.imageHeight / girl.imageWidth * width
        }
        
        return titleHeight + picHeight + 20
    }
    
    func setupCell(girl: CCGirl!) {
        titleLabel!.text = girl.imageTitle
        girlImageView!.setImage(girl.imageUrlString, placeHolder: nil)
        var titleHeight : CGFloat
        if (girl.imageTitle.length > 0){
            titleHeight = titleLabel!.labelHeight()
        }else{
            titleHeight = 0;
        }
        var picHeight : CGFloat
        if girl.imageWidth <= 0 {
            picHeight = 0;
        }else {
            picHeight = girl.imageHeight / girl.imageWidth * screenWidth
        }
        
        titleLabel!.frame = CGRectMake(10, 10, screenWidth - 20, titleHeight)
        girlImageView!.frame = CGRectMake(0, CGRectGetMaxY(titleLabel!.frame) + 10, screenWidth, picHeight)
    }
}
