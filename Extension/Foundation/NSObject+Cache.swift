//  Created by Songwen Ding on 9/5/16.
//  Copyright © 2016 DingSoung. All rights reserved.

import Foundation

@objc public class Cache : NSObject {
    
    @nonobjc public static var directory : String {
        guard let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first else {
            return ""
        }
        return path
    }
    
    private static let association = Association<NSCache<NSString, AnyObject>>()
    public class final var memory: NSCache<NSString, AnyObject> {
        return Cache.association[self] ?? {
            let cache = NSCache<NSString, AnyObject>()
            cache.countLimit = 1024
            cache.totalCostLimit = 1024 * 1024 * 50 // 50MB
            cache.evictsObjectsWithDiscardedContent = true
            return cache
            }()
    }
}

extension NSObject {
    
    // MARK: set and get
    /// example key: "10209383" path: "/cities/street"
    @discardableResult public final func setCache(forKey key: String, atPath path: String) -> Error? {
        do {
            try FileManager.default.createDirectory(atPath: Cache.directory + path, withIntermediateDirectories: true, attributes: nil)
        } catch let error {
            return error
        }
        let data = NSKeyedArchiver.archivedData(withRootObject: self)
        // if data.count < 20480, use SQLite else FileManager
        do {
            try data.write(to: URL(fileURLWithPath: Cache.directory + path + "/" + key), options: Data.WritingOptions.atomic)
            Cache.memory.setObject(self, forKey: (path + "/" + key) as NSString, cost: data.count)
            return nil
        } catch let error {
            return error
        }
    }
    
    /// example keypath: "/cities/street/10209383"
    public class final func cache(forKeyPath keyPath: String, fail: ((Error) -> Swift.Void)?) -> Any? {
        if let object = Cache.memory.object(forKey: keyPath as NSString) {
            return object
        }
        do {
            let data = try NSData(contentsOf: URL(fileURLWithPath: Cache.directory + keyPath), options: NSData.ReadingOptions.dataReadingMapped)
            guard let object = NSKeyedUnarchiver.unarchiveObject(with: data as Data) else {
                fail?(NSError(domain: "unarchibe object fail", code: -1, userInfo: ["keyPath":keyPath,"data":data]) as Error)
                return nil
            }
            Cache.memory.setObject(object as AnyObject, forKey: keyPath as NSString)
            return object
        } catch let error {
            fail?(error)
            return nil
        }
    }
    
    // MARK: async set and get
    public final func setCache(forKey key: String, atPath path: String, complete: @escaping ((Error?) -> Swift.Void)) {
        OperationQueue.current?.addOperation { [weak self] in
            complete(self?.setCache(forKey: key, atPath: path))
        }
    }
    
    public final func cache(forKeyPath keyPath: String, complete: @escaping ((Any?, Error?) -> Swift.Void)) {
        OperationQueue.current?.addOperation {
            let ret = NSObject.cache(forKeyPath: keyPath, fail: { (error) in
                complete(nil, error)
            })
            if (ret != nil) {
                complete(ret, nil)
            }
        }
    }
    
    // MARK: clean
    private class final func removeFile(atPath path: String) -> Error? {
        do {
            try FileManager.default.removeItem(atPath: Cache.directory + path)
        } catch let error {
            return error
        }
        return nil
    }
    
    @discardableResult public class final func removeCache(forKeyPath keyPath:String) -> Error? {
        Cache.memory.removeObject(forKey: keyPath as NSString)
        return NSObject.removeFile(atPath: keyPath)
    }
    
    @discardableResult public class final func removeCache(forPath path:String) -> Error? {
        Cache.memory.removeAllObjects()
        return NSObject.removeFile(atPath: path)
    }
}
