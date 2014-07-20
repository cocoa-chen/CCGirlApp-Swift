//
//  UIImageView+WebCacheExt.swift
//  CCFunnyClient-Swift
//
//  Created by CocoaChen on 14-7-20.
//  Copyright (c) 2014 CocoaChen. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setImage(urlString: String,placeHolder: UIImage?) {
        var url = NSURL.URLWithString(urlString)
        var cacheFileName = url.lastPathComponent
        var cachePath = FileManagerUtil.cachePath(cacheFileName)
        var image: AnyObject = FileManagerUtil.imageDataFromPath(cachePath)
        if image as NSObject != NSNull() {
            self.image = image as UIImage
        }else {
            if placeHolder {
                dispatch_async(dispatch_get_main_queue(), {
                    self.image = placeHolder
                })
            }
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                var imageData = NSData.dataWithContentsOfURL(url, options: .DataReadingMappedIfSafe, error: nil)
                var image : UIImage? = UIImage(data: imageData)
                if image {
                    dispatch_async(dispatch_get_main_queue(), {
                        self.image = image
                        FileManagerUtil.cacheImageToPath(cachePath, imageData: imageData)
                    })
                }
            })
        }
    }
}
