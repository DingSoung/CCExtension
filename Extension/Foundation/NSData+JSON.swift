//  Created by Songwen Ding on 15/6/6.
//  Copyright (c) 2015年 DingSoung. All rights reserved.

import Foundation

@objc
extension NSData {
    
    /// JSON data -> JSON Object (Array or Dictionary)
    public final var jsonObject: Any? {
        return (self as Data).jsonObject
    }
    
    /// JSON data -> JSON Array
    public final var jsonArray: NSArray? {
        return self.jsonObject as? NSArray
    }
    
    /// JSON data -> JSON Dictionary
    public final var jsonDictionary: NSDictionary? {
        return self.jsonObject as? NSDictionary
    }
    
    /// JSON Data -> JSON String
    public final var jsonString: NSString? {
        return (self as Data).jsonString
    }
    
}
