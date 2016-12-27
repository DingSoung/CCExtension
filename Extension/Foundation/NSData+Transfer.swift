//  Created by Songwen Ding on 15/6/6.
//  Copyright (c) 2015年 DingSoung. All rights reserved.

import Foundation

extension NSData {
    
    /// JSON data -> JSON Object (Array or Dictionary)
    public var jsonObj: Any? {
        do {
            return try  JSONSerialization.jsonObject(with: self as Data, options: JSONSerialization.ReadingOptions.mutableLeaves)
        } catch let error as NSError {
            print("data formar fail:\(error.domain)")
            return nil
        }
    }
    
    /// JSON data -> JSON Array
    public var jsonArray: NSArray? {
        return self.jsonObj as? NSArray
    }
    
    /// JSON data -> JSON Dictionary
    public var jsonDictionary: NSDictionary? {
        return self.jsonObj as? NSDictionary
    }
    
    /// JSON Data -> JSON String
    public var jsonStr: NSString? {
        guard let str = NSString(data: self as Data, encoding: String.Encoding.utf8.rawValue) else {
            print("format \(String(describing: self)) to String fail)")
            return nil
        }
        return str
    }
    
}
