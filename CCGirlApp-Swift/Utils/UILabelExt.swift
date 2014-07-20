//
//  UILabelExt.swift
//  CCFunnyClient-Swift
//
//  Created by CocoaChen on 14-7-19.
//  Copyright (c) 2014 CocoaChen. All rights reserved.
//

import UIKit

extension UILabel {
    
    func labelHeight() -> CGFloat{
        var contentSize : CGSize
        var osString : String = UIDevice.currentDevice().systemName
        var osVersion = String.bridgeToObjectiveC(osString)().floatValue
        var textString : NSString = String.bridgeToObjectiveC(self.text)()
        if osVersion >= 7.0 {
            var paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineBreakMode = self.lineBreakMode
            paragraphStyle.alignment = self.textAlignment
            
            var attributes = [NSFontAttributeName : self.font,NSParagraphStyleAttributeName : paragraphStyle]
            contentSize = textString.boundingRectWithSize(CGSizeMake(self.frame.size.width, MAXFLOAT), options: .UsesLineFragmentOrigin, attributes: attributes, context: nil).size
        }else {
            contentSize = textString.sizeWithFont(self.font, constrainedToSize: CGSizeMake(self.frame.size.width, MAXFLOAT), lineBreakMode: self.lineBreakMode)
        }
        return contentSize.height
    }
    class func heightForLabel(text: NSString,maxWidth: CGFloat,font: UIFont,lineBreakMode: NSLineBreakMode) -> CGFloat{
        var contentSize : CGSize
        var osString : String = UIDevice.currentDevice().systemName
        var osVersion = String.bridgeToObjectiveC(osString)().floatValue
        if osVersion >= 7.0 {
            var paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineBreakMode = lineBreakMode
            
            var attributes = [NSFontAttributeName : font,NSParagraphStyleAttributeName : paragraphStyle]
            contentSize = text.boundingRectWithSize(CGSizeMake(maxWidth, MAXFLOAT), options: .UsesLineFragmentOrigin, attributes: attributes, context: nil).size
        }else {
            contentSize = text.sizeWithFont(font, constrainedToSize: CGSizeMake(maxWidth, MAXFLOAT), lineBreakMode: lineBreakMode)
        }
        return contentSize.height
    }
}