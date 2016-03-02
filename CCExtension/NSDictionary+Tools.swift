//
//  Dictionary+Tools.swift
//  Autumn
//
//  Created by D.Alex on 15/9/29.
//  Copyright © 2015年 Alex D. All rights reserved.
//

import Foundation

extension NSDictionary {
    
    /**
    dictionary to string
    */
    public var jsonStr: NSString {
        var json:NSString = "{}"
        do {
            let data = try NSJSONSerialization.dataWithJSONObject(self, options: NSJSONWritingOptions.PrettyPrinted)
            if let str = NSString(data: data, encoding: NSUTF8StringEncoding) {
                json = str
            }
        } catch {
            print("NSdictionary transfer to JSON NSString fail")
        }
        return json
    }
}
