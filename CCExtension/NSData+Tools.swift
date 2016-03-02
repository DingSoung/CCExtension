//
//  NSData+Tools.swift
//  GiftBox
//
//  Created by Ding Soung on 15/6/6.
//  Copyright (c) 2015年 xinyihezi. All rights reserved.
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
        
    public var MD5: NSData {
        let result = NSMutableData(length: Int(CC_MD5_DIGEST_LENGTH))!
        CC_MD5(bytes, CC_LONG(length), UnsafeMutablePointer<UInt8>(result.mutableBytes))
        return NSData(data: result)
    }
    
    public var SHA1: NSData {
        let result = NSMutableData(length: Int(CC_SHA1_DIGEST_LENGTH))!
        CC_SHA1(bytes, CC_LONG(length), UnsafeMutablePointer<UInt8>(result.mutableBytes))
        return NSData(data: result)
    }
    
    public var hexString: String {
        return self.toHexString()
    }
    
    public var checksum: UInt16 {
        var s:UInt32 = 0;
        
        var bytesArray = self.arrayOfBytes
        
        for (var i = 0; i < bytesArray.count; i++) {
            _ = bytesArray[i]
            s = s + UInt32(bytesArray[i])
        }
        s = s % 65536;
        return UInt16(s);
    }
    
    public var arrayOfBytes: [UInt8] {
        let count = self.length / sizeof(UInt8)
        var bytesArray = [UInt8](count: count, repeatedValue: 0)
        self.getBytes(&bytesArray, length:count * sizeof(UInt8))
        return bytesArray
    }
    
    public func toHexString() -> String {
        let count = self.length / sizeof(UInt8)
        var bytesArray = [UInt8](count: count, repeatedValue: 0)
        self.getBytes(&bytesArray, length:count * sizeof(UInt8))
        
        var s:String = "";
        for byte in bytesArray {
            s = s + String(format:"%02X", byte)
        }
        return s;
    }
    
    class public func withBytes(bytes: [UInt8]) -> NSData {
        return NSData(bytes: bytes, length: bytes.count)
    }
}




