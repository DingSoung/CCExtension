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
    public class final var memoryCache: NSCache<NSString, AnyObject> {
        return NSObject.association[self] ?? {
            let cache = NSCache<NSString, AnyObject>()
            cache.countLimit = 1024
            cache.totalCostLimit = 1024 * 1024 * 50 // 50MB
            cache.evictsObjectsWithDiscardedContent = true
            return cache
            }()
    }
    
    // MARK: set and get
    /// example key: "10209383" path: "/cities/street"
    @discardableResult public final func setCache(forKey key: String, atPath path: String) -> Error? {
        do {
            try FileManager.default.createDirectory(atPath: NSObject.cacheDirectory + path, withIntermediateDirectories: true, attributes: nil)
        } catch let error {
            return error
        }
        let data = NSKeyedArchiver.archivedData(withRootObject: self)
        // if data.count < 20480, use SQLite else FileManager
        do {
            try data.write(to: URL(fileURLWithPath: NSObject.cacheDirectory + path + "/" + key), options: Data.WritingOptions.atomic)
            NSObject.memoryCache.setObject(self, forKey: (path + "/" + key) as NSString, cost: data.count)
            return nil
        } catch let error {
            return error
        }
    }
    
    /// example keypath: "/cities/street/10209383"
    public class final func cache(forKeyPath keyPath: String, fail: ((Error) -> Swift.Void)?) -> Any? {
        if let object = self.memoryCache.object(forKey: keyPath as NSString) {
            return object
        }
        do {
            let data = try NSData(contentsOf: URL(fileURLWithPath: self.cacheDirectory + keyPath), options: NSData.ReadingOptions.dataReadingMapped)
            guard let object = NSKeyedUnarchiver.unarchiveObject(with: data as Data) else {
                fail?(NSError(domain: "unarchibe object fail", code: -1, userInfo: ["keyPath":keyPath,"data":data]) as Error)
                return nil
            }
            self.memoryCache.setObject(object as AnyObject, forKey: keyPath as NSString)
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
            try FileManager.default.removeItem(atPath: self.cacheDirectory + path)
        } catch let error {
            return error
        }
        return nil
    }
    
    @discardableResult public class final func removeCache(forKeyPath keyPath:String) -> Error? {
        self.memoryCache.removeObject(forKey: keyPath as NSString)
        return NSObject.removeFile(atPath: keyPath)
    }
    
    @discardableResult public class final func removeCache(forPath path:String) -> Error? {
        self.memoryCache.removeAllObjects()
        return NSObject.removeFile(atPath: path)
    }
}
