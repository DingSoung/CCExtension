//
//  CCNetworkRequest.swift
//  DEMO
//
//  Created by Alex D. on 3/16/16.
//  Copyright © 2016 ifnil. All rights reserved.
//

import Foundation

public class CCNetworkRequest: NSMutableURLRequest {
    var startTime:NSTimeInterval
    var retryTimes:Int
    
    override init(URL: NSURL, cachePolicy: NSURLRequestCachePolicy, timeoutInterval: NSTimeInterval) {
        self.startTime = NSTimeIntervalSince1970
        self.retryTimes = 0
        super.init(URL: URL, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
    }
    
    public convenience init(URL: NSURL, cachePolicy: NSURLRequestCachePolicy, timeoutInterval: NSTimeInterval, startTime:NSTimeInterval) {
        self.init(URL: URL, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
        self.startTime = startTime
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}