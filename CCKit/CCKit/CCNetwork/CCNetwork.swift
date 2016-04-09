//
//  CCNetwork.swift
//  DEMO
//
//  Created by Alex D. on 12/21/15.
//  Copyright © 2015 ifnil. All rights reserved.
//

import Foundation

public class CCNetwork: NSObject {
    
    public static let instance = CCNetwork()
    public var session:NSURLSession
    
    private override init() {
        session = NSURLSession.sharedSession()
        
        //http://www.raywenderlich.com/51127/nsurlsession-tutorial
        
        //configuration:
        //session.configuration.allowsCellularAccess = true //移动网络
        
        //session.configuration.HTTPAdditionalHeaders = ["Accept": "application/json"] //test/html
        
        //session.configuration.timeoutIntervalForRequest = 30.0;
        //session.configuration.timeoutIntervalForResource = 60.0;
        //session.configuration.HTTPMaximumConnectionsPerHost = 10;
        
        super.init()
    }
    deinit {
    }
    
    public func generateRequest(httpMethod:String, url:String, parameter:NSData?) -> CCNetworkRequest? {
        guard let URL = NSURL(string: url) else {
            return nil
        }
        let request = CCNetworkRequest(URL: URL, cachePolicy: NSURLRequestCachePolicy.UseProtocolCachePolicy, timeoutInterval: 12, startTime: NSTimeIntervalSince1970)
        request.HTTPMethod = httpMethod
        if httpMethod == "POST" {
            request.HTTPBody = parameter
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        }
        return request
    }
    
    public func processTask(request:CCNetworkRequest, success:((data:NSData)->Void), fail:((error:NSError)->Void)) -> NSURLSessionDataTask {
        
        //check network available
        
        let task = self.session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            if let data = data {
                success (data: data)
            } else {
                if request.retryTimes >= 5 || NSTimeIntervalSince1970 >= request.startTime + 60 {
                    if let error = error {
                        fail(error: error)
                    } else {
                        fail(error: NSError(domain: "requet timeout", code: -1, userInfo: nil))
                    }
                } else {
                    self.processTask(request, success: success, fail: fail)
                }
                request.retryTimes += 1
            }
        }
        task.resume()
        return task
    }
}



