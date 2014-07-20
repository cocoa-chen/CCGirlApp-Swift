//
//  FileManagerUtil.swift
//  CCFunnyClient-Swift
//
//  Created by CocoaChen on 14-7-20.
//  Copyright (c) 2014 CocoaChen. All rights reserved.
//

import UIKit

class FileManagerUtil: NSObject {
   
    class func cachePath(fileName: String) -> String {
        var arr = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true)
        var path = arr[0] as String
        return "\(path)/\(fileName)"
    }
    
    class func cacheImageToPath(path:String,imageData:NSData)-> Bool {
        return imageData.writeToFile(path, atomically: true)
    }
    
    class func imageDataFromPath(path:String) -> AnyObject {
        var exist = NSFileManager.defaultManager().fileExistsAtPath(path)
        if exist {
            return UIImage(contentsOfFile: path)
        }
        return NSNull()
    }
    
}
