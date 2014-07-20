//
//  CCGirl.swift
//  CCFunnyClient-Swift
//
//  Created by CocoaChen on 14-7-19.
//  Copyright (c) 2014 CocoaChen. All rights reserved.
//

import UIKit

class CCGirl: NSObject {
    let imageTitle : NSString
    let imageUrlString : NSString
    let imageWidth : Float
    let imageHeight : Float
    init(attributes : NSDictionary) {
        self.imageTitle = attributes["wbody"] as NSString
        if self.imageTitle.length == 0 {
            self.imageTitle = "该配图没有标题，这是随便写的一句话，主要是看美女，\ue415\ue415\ue415\ue415"
        }
        self.imageUrlString = attributes["wpic_middle"] as NSString
        var imageWidthString : NSString = attributes["wpic_m_width"] as NSString
        self.imageWidth = imageWidthString.floatValue
        var imageHeightString : NSString = attributes["wpic_m_height"] as NSString
        self.imageHeight = imageHeightString.floatValue
        
        super.init()
    }
}
