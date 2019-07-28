//  Created by Songwen Ding on 2016/7/18.
//  Copyright © 2019 DingSoung. All rights reserved.

#if canImport(SystemConfiguration)
import SystemConfiguration

extension SCNetworkReachability {
    public typealias UpdateBlock = @convention(block) (SCNetworkReachability) -> Void

    private static let association = Association<NSMapTable<NSString, AnyObject>>()
    private var blocks: NSMapTable<NSString, AnyObject> {
        return SCNetworkReachability.association[self] ?? NSMapTable(keyOptions: .weakMemory, valueOptions: .weakMemory)
    }

    public func addObserve(uid: String, updateBlock: @escaping UpdateBlock) {
        let object = unsafeBitCast(updateBlock, to: AnyObject.self)
        self.blocks.setObject(object, forKey: uid as NSString)
    }

    public func removeObserve(uid: String) {
        self.blocks.removeObject(forKey: uid as NSString)
    }

    @discardableResult
    public func start() -> Bool {
        var context = SCNetworkReachabilityContext(version: 0,
                                                   info: UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque()),
                                                   retain: nil,
                                                   release: nil,
                                                   copyDescription: nil)
        let callback: SCNetworkReachabilityCallBack = { _, _, info in
            guard let info = info else {
                return
            }
            let networkReachability = Unmanaged<SCNetworkReachability>.fromOpaque(info).takeUnretainedValue() as SCNetworkReachability
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
