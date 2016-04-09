//
//  CCNetwork+Tools.swift
//  DEMO
//
//  Created by Alex D. on 3/16/16.
//  Copyright © 2016 ifnil. All rights reserved.
//

import Foundation

extension CCNetwork {
    public class func POST(url:String, parameter:NSDictionary, success:((data: NSData) -> Void), fail:((error: NSError) -> Void)) -> Void {
        let parameter = NSKeyedArchiver.archivedDataWithRootObject(parameter)
        guard let request = CCNetwork.instance.generateRequest("POST", url: url, parameter: parameter) else {
            fail(error: NSError(domain: "generate request", code: -1, userInfo: ["url" : url, "parameter": parameter]))
            return
        }
        CCNetwork.instance.processTask(request, success: success, fail: fail)
    }
    
    public class func GET(url:String, parameter:NSDictionary, success:((data: NSData) -> Void), fail:((error: NSError) -> Void)) {
        guard let request = CCNetwork.instance.generateRequest("GET", url: url, parameter: nil) else {
            fail(error: NSError(domain: "generate request", code: -1, userInfo: ["url" : url]))
            return
        }
        CCNetwork.instance.processTask(request, success: success, fail: fail)
    }
}