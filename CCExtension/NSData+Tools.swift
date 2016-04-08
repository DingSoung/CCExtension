//
//  NSData+Tools.swift
//  GiftBox
//
//  Created by Songwen Ding on 15/6/6.
//  Copyright (c) 2015年 ifnil All rights reserved.
//

import Foundation
//MARK: need add bridge header #import <CommonCrypto/CommonCrypto.h> 
extension NSData {
    
    ///json data to jsonObject (Array or Dictionary)
    public var jsonObject: AnyObject? {
        do {
            return try NSJSONSerialization.JSONObjectWithData(self, options: NSJSONReadingOptions.AllowFragments)
        } catch {
             return nil
        }
    }
}




