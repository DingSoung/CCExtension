//  Created by Songwen Ding on 9/5/16.
//  Copyright © 2016 DingSoung. All rights reserved.

import Foundation

extension NSObject {
    
    @nonobjc private static var cacheDirectory:String {
        get {
            guard let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first else {
                return ""
            }
            return path
        }
    }
    
    private struct AssociatedKeys{
        static var cache = "cache"
    }
    
    public class var memoryCache: NSCache<NSString, AnyObject>? {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.cache, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let cache = objc_getAssociatedObject(self, &AssociatedKeys.cache) as? NSCache<NSString, AnyObject> {
                return cache
            } else {
                self.memoryCache = NSCache()
                return self.memoryCache
            }
        }
    }
    
    public class final func setCache(object:AnyObject, forKey key:String, atPath path:String) ->Bool {
        do {
            try FileManager.default.createDirectory(atPath: self.cacheDirectory + path, withIntermediateDirectories: true, attributes: nil)
        } catch _ as NSError {
            return false
        }
        self.memoryCache?.setObject(object, forKey: (path + key) as NSString)
        let data = NSKeyedArchiver.archivedData(withRootObject: object)
        do {
            try data.write(to: URL(fileURLWithPath: self.cacheDirectory + path + key), options: Data.WritingOptions.atomic)
            return true
        } catch {
            return false
        }
    }
    
    public class final func cache(key:String, atPath path:String) -> AnyObject? {
        if let object = self.memoryCache?.object(forKey: (path + key) as NSString) {
            return object
        }
        do {
            let data = try NSData(contentsOf: NSURL(fileURLWithPath: self.cacheDirectory + path + key) as URL, options: NSData.ReadingOptions.dataReadingMapped)
            guard let object = NSKeyedUnarchiver.unarchiveObject(with: data as Data) as AnyObject? else {
                return nil
            }
            self.memoryCache?.setObject(object, forKey: (path + key) as NSString)
            return object as AnyObject?
        } catch _ as NSError {
            return nil
        }
    }
    
    public class final func removeCache(key:String, atPath path:String) -> Bool {
        self.memoryCache?.removeObject(forKey: (path + key) as NSString)
        do {
            try FileManager.default.removeItem(atPath: self.cacheDirectory + path + key)
        } catch {
            return false
        }
        return true
    }
    
    public class final func removeCache(path:String) -> Bool {
        self.memoryCache?.removeAllObjects()
        do {
            try FileManager.default.removeItem(atPath: self.cacheDirectory + path)
        } catch _ as NSError {
            return false
        }
        return true
    }
}
