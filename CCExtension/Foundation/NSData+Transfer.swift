//  Created by Songwen Ding on 15/6/6.
//  Copyright (c) 2015年 DingSoung. All rights reserved.

import Foundation

extension NSData {
    
    /// JSON data -> JSON Object (Array or Dictionary)
    public var jsonObject: AnyObject? {
        do {
            return try NSJSONSerialization.JSONObjectWithData(self, options: NSJSONReadingOptions.MutableContainers)
        } catch let error as NSError {
            print("data formar fail:\(error.domain)")
            return nil
        }
    }
    
    /// JSON data -> JSON Array
    public var jsonArray: NSArray? {
        return self.jsonObject as? NSArray
    }
    
    /// JSON data -> JSON Dictionary
    public var jsonDictionary: NSDictionary? {
        return self.jsonObject as? NSDictionary
    }
    
    /// JSON Data -> JSON String
    public var jsonStr: NSString? {
        guard let str = NSString(data: self, encoding: NSUTF8StringEncoding) else {
            print("format \(String(self)) to String fail)")
            return nil
        }
        return str
    }
    
}