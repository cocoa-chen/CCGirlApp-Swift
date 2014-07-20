//
//  CCHttpRequest.swift
//  CCFunnyClient-Swift
//
//  Created by CocoaChen on 14-7-19.
//  Copyright (c) 2014 CocoaChen. All rights reserved.
//

import UIKit

class CCHttpRequest: NSObject {
    init() {
        super.init()
    }
    
    class func requestWithURLString(urlString:String,completionHandler:(data:AnyObject) -> Void) {
        var URL = NSURL.URLWithString(urlString)
        var request = NSURLRequest(URL: URL)
        var queue = NSOperationQueue()
        
        NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler: { (NSURLRequest response, NSData data, NSError error) in
            if error {
                dispatch_async(dispatch_get_main_queue(), {
                    completionHandler(data: NSNull())
                })
            }else {
                var retString = NSString(data: data, encoding: NSUTF8StringEncoding)
                var jsonData = retString.dataUsingEncoding(NSUTF8StringEncoding)
                let jsonDict = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
                dispatch_async(dispatch_get_main_queue(), {
                    completionHandler(data:jsonDict)
                })
            }
        })
    }

}
