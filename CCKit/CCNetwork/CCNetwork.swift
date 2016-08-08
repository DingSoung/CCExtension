//
//  CCNetwork.swift
//  DEMO
//
//  Created by Songwen Ding 12/21/15.
//  Copyright © 2015 DingSoung. All rights reserved.
//

import Foundation

public class CCNetwork: NSObject {
    
    public static let instance = CCNetwork()
    public var session:NSURLSession
    
    private override init() {
        session = NSURLSession.sharedSession()
        
        //configuration:
        session.configuration.HTTPAdditionalHeaders = ["Accept": "application/json"] //test/html
        //session.configuration.timeoutIntervalForRequest = 30.0;
        //session.configuration.timeoutIntervalForResource = 60.0;
        //session.configuration.networkServiceType
        session.configuration.allowsCellularAccess = true
        //session.configuration.HTTPMaximumConnectionsPerHost = 10;
        super.init()
    }
    deinit {
    }
    
    public func generateRequest(httpMethod:String, url:String, parameter:NSData?) -> NSMutableURLRequest? {
        guard let URL = NSURL(string: url) else {
            return nil
        }
        let request = NSMutableURLRequest(URL: URL)
        
        //check network available
        //        if (有网) {
        //            cachePolicy = NSURLRequestUseProtocolCachePolicy;
        //        }
        //        else{
        //            cachePolicy = NSURLRequestReturnCacheDataDontLoad;
        //request.cachePolicy = NSURLRequestCachePolicy.UseProtocolCachePolicy
        request.timeoutInterval = 12
        
        //request.mainDocumentURL
        //request.networkServiceType
        request.allowsCellularAccess = true
        
        request.HTTPMethod = httpMethod
        if httpMethod == "POST" {
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.HTTPBody = parameter
        }
        
        //request.allHTTPHeaderFields
        //request.HTTPShouldHandleCookies
        //request.HTTPShouldUsePipelining
        return request
    }
    
    public func processTask(request:NSMutableURLRequest, success:((data:NSData)->Void), fail:((error:NSError)->Void)) -> NSURLSessionDataTask {
        
        //check network available
        
        let task = self.session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            if let data = data {
                success(data: data)
            } else {
                if let error = error {
                    fail(error: error)
                } else {
                    fail(error: NSError(domain: "requet timeout", code: -1, userInfo: nil))
                }
            }
        }
        task.resume()
        return task
    }
}

