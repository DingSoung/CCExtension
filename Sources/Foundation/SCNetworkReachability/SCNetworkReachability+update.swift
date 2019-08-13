//  Created by Songwen Ding on 2016/7/18.
//  Copyright © 2019 DingSoung. All rights reserved.

#if canImport(SystemConfiguration)
import SystemConfiguration
#if canImport(Foundation)
import Foundation

extension SCNetworkReachability {
    public typealias UpdateBlock = @convention(block) (SCNetworkReachability) -> Void

    private static let association = Association<NSMapTable<NSString, AnyObject>>()
    private var blocks: NSMapTable<NSString, AnyObject> {
        if let blocks = SCNetworkReachability.association[self] {
            return blocks
        } else {
            let blocks = NSMapTable<NSString, AnyObject>(keyOptions: .weakMemory, valueOptions: .weakMemory)
            SCNetworkReachability.association[self] = blocks
            return blocks
        }
    }

    public func addObserve(uid: String, updateBlock: @escaping UpdateBlock) {
        let object = unsafeBitCast(updateBlock, to: AnyObject.self)
        blocks.setObject(object, forKey: uid as NSString)
    }

    public func removeObserve(uid: String) {
        blocks.removeObject(forKey: uid as NSString)
    }

    @discardableResult
    public func start() -> Bool {
        let info = UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque())
        var context = SCNetworkReachabilityContext(version: 0,
                                                   info: info,
                                                   retain: nil,
                                                   release: nil,
                                                   copyDescription: nil)
        let callback: SCNetworkReachabilityCallBack = { _, _, info in
            guard let info = info else {
                return
            }
            let networkReachability = Unmanaged<SCNetworkReachability>.fromOpaque(info).takeUnretainedValue()
                as SCNetworkReachability
            let enumerator = networkReachability.blocks.objectEnumerator()
            while let object: AnyObject = enumerator?.nextObject() as AnyObject? {
                let block = unsafeBitCast(object, to: UpdateBlock.self)
                block(networkReachability)
            }
        }
        return SCNetworkReachabilitySetCallback(self, callback, &context)
            && SCNetworkReachabilityScheduleWithRunLoop(self, CFRunLoopGetCurrent(), CFRunLoopMode.defaultMode.rawValue)
    }

    public func stop() {
        SCNetworkReachabilityUnscheduleFromRunLoop(self, CFRunLoopGetCurrent(), CFRunLoopMode.defaultMode.rawValue)
    }
}
#endif
#endif
