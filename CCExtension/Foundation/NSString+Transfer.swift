//  Created by Songwen Ding on 12/15/15.
//  Copyright © 2015 DingSoung. All rights reserved.

import Foundation
import CoreGraphics
import UIKit

extension NSString {
    
    /// JSON String -> JSON Dictionary
    public var jsonDictionary: NSDictionary? {
        guard let JsonData = self.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) else {
            return nil
        }
        do {
            if let JSONDictionary = try NSJSONSerialization.JSONObjectWithData(JsonData, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                return JSONDictionary
            } else {
                return nil
            }
        } catch let error as NSError {
            print("format \(String(self)) to Dictionary fail:\(error.domain)")
            return nil
        }
    }
    
    /// url format -> Dictionary  ext:http://domain.com?ID=1&code=2
    public var urlDictionary: NSDictionary {
        let dict = NSMutableDictionary()
        let params = self.componentsSeparatedByString("&")
        for param in params {
            let strs = param.componentsSeparatedByString("=")
            if strs.count >= 2 {
                if let value = strs[1].stringByRemovingPercentEncoding {
                    dict.setValue(value, forKey: strs[0])
                } else {
                    print("un-resolve key:\(strs[0]) value:\(strs[1])")
                }
            } else {
                print("un-resolve strs \(strs)")
            }
        }
        return dict
    }
}


