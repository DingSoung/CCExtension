//
//  NSString+Tools.swift
//  DEMO
//
//  Created by D.Alex on 12/15/15.
//  Copyright © 2015 Alex. All rights reserved.
//

import Foundation
extension NSString {
    
    /**
     string to dictionary
     */
    public var jsonDict: NSDictionary {
        guard let JsonData = self.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) else {
            return [String: String]()
        }
        do {
            if let JSONDictionary = try NSJSONSerialization.JSONObjectWithData(JsonData, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                return JSONDictionary
            } else {
                return [String: String]()
            }
        } catch {
            return [String: String]()
        }
    }
    
    public var urlToDict: NSDictionary {
        let dict = NSMutableDictionary()
        let params = self.componentsSeparatedByString("&")
        for param in params {
            let strs = param.componentsSeparatedByString("=")
            if strs.count >= 2 {
                if let value = strs[1].stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding) {
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
    
    public var lenghtOfZhEn: Int {
        let enc = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(CFStringEncodings.GB_18030_2000.rawValue))
        guard let da = self.dataUsingEncoding(enc) else {
            return 0
        }
        return da.length
    }

}
