//  Created by Songwen Ding on 9/5/16.
//  Copyright © 2016 DingSoung. All rights reserved.

import Foundation

extension NSObject {
    
    @nonobjc private static var cacheDirectory : String {
        guard let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first else {
            return ""
        }
        return path
    }
    
    private static let association = Association<NSCache<NSString, AnyObject>>()
    public class final var memoryCache: NSCache<NSString, AnyObject>? {
        set {NSObject.association[self] = newValue}
        get {return NSObject.association[self]}
    }
    
    /// example key: "10209383" path: "/cities/street"
    @discardableResult public final func setCache(forKey key: String, atPath path: String) -> Error? {
        do {
            try FileManager.default.createDirectory(atPath: NSObject.cacheDirectory + path, withIntermediateDirectories: true, attributes: nil)
        } catch let error {
            return error
        }
        NSObject.memoryCache?.setObject(self, forKey: (path + "/" + key) as NSString)
        let data = NSKeyedArchiver.archivedData(withRootObject: self)
        do {
            try data.write(to: URL(fileURLWithPath: NSObject.cacheDirectory + path + "/" + key), options: Data.WritingOptions.atomic)
            return nil
        } catch let error {
            return error
        }
    }
    /// example keypath: "/cities/street/10209383"
    public class final func cache(forKeyPath keyPath: String, fail: ((Error) -> Swift.Void)?) -> Any? {
        if let object = self.memoryCache?.object(forKey: keyPath as NSString) {
            return object
        }
        do {
            let data = try NSData(contentsOf: URL(fileURLWithPath: self.cacheDirectory + keyPath), options: NSData.ReadingOptions.dataReadingMapped)
            guard let object = NSKeyedUnarchiver.unarchiveObject(with: data as Data) else {
                OperationQueue.current?.addOperation {
                    fail?(NSError(domain: "unarchibe object fail", code: -1, userInfo: ["keyPath":keyPath,"data":data]) as Error)
                }
                return nil
            }
            self.memoryCache?.setObject(object as AnyObject, forKey: keyPath as NSString)
            return object
        } catch let error {
            OperationQueue.current?.addOperation {
                fail?(error)
            }
            return nil
        }
    }
    
    private class final func removeFile(atPath path: String) -> Error? {
        do {
            try FileManager.default.removeItem(atPath: self.cacheDirectory + path)
        } catch let error {
            return error
        }
        return nil
    }
    
    @discardableResult public class final func removeCache(forKeyPath keyPath:String) -> Error? {
        self.memoryCache?.removeObject(forKey: keyPath as NSString)
        return NSObject.removeFile(atPath: keyPath)
    }
    
    @discardableResult public class final func removeCache(forPath path:String) -> Error? {
        self.memoryCache?.removeAllObjects()
        return NSObject.removeFile(atPath: path)
    }
}

