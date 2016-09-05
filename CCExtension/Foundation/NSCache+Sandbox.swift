//  Created by Songwen Ding on 9/5/16.
//  Copyright © 2016 DingSoung. All rights reserved.

import Foundation

public extension NSCache {
    
    @nonobjc private static var cacheDirectory:String {
        get {
            guard let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true).first else {
                return ""
            }
            return path
        }
    }
    @nonobjc private static let cache:NSCache? = NSCache()
    
    public class final func setCache(obj:AnyObject, forKey key:String, atPath path:String) ->Bool {
        do {
            try NSFileManager.defaultManager().createDirectoryAtPath(self.cacheDirectory + path, withIntermediateDirectories: true, attributes: nil)
        } catch _ as NSError {
            return false
        }
        self.cache?.setObject(obj, forKey: path + key)
        return NSKeyedArchiver.archivedDataWithRootObject(obj).writeToFile(self.cacheDirectory + path + key, atomically: true)
    }
    
    public class final func cacheForKey(key:String, atPath path:String) -> AnyObject? {
        if let image = self.cache?.objectForKey(path + key) {
            return image
        }
        do {
            let data = try NSData(contentsOfURL: NSURL(fileURLWithPath: self.cacheDirectory + path + key), options: NSDataReadingOptions.DataReadingMapped)
            guard let obj = NSKeyedUnarchiver.unarchiveObjectWithData(data) else {
                return nil
            }
            self.cache?.setObject(obj, forKey: path + key)
            return obj
        } catch _ as NSError {
            return nil
        }
    }
    
    public class final func removeCacheForKey(key:String, atPath path:String) -> Bool {
        self.cache?.removeObjectForKey(path + key)
        do {
            try NSFileManager.defaultManager().removeItemAtPath(self.cacheDirectory + path + key)
        } catch {
            return false
        }
        return true
    }
    
    public class final func removeCacheAtPath(path:String) -> Bool {
        self.cache?.removeAllObjects()
        do {
            try NSFileManager.defaultManager().removeItemAtPath(self.cacheDirectory + path)
        } catch _ as NSError {
            return false
        }
        return true
    }
}