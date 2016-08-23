//
//  Dictionary+Tools.swift
//  Autumn
//
//  Created by Songwen Ding on 15/9/29.
//  Copyright © 2015年 DingSoung. All rights reserved.
//

import Foundation

extension NSDictionary {
    
    // Dictionary -> JSON Data
    public var jsonData: NSData? {
        do {
            return try NSJSONSerialization.dataWithJSONObject(self, options: NSJSONWritingOptions.PrettyPrinted)
            } catch let error as NSError {
            print("format \(String(self)) to Data fail:\(error.domain)")
            return nil
        }
    }
}
