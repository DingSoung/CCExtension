//  Created by Songwen Ding on 2016/7/18.
//  Copyright © 2019 DingSoung. All rights reserved.

#if canImport(SystemConfiguration)
import SystemConfiguration

extension SCNetworkReachability {
    public var flags: SCNetworkReachabilityFlags {
        var networkReachabilityFlags: SCNetworkReachabilityFlags = []
        SCNetworkReachabilityGetFlags(self, &networkReachabilityFlags)
        return networkReachabilityFlags
    }

    public var isOnline: Bool {
        return flags.contains(.reachable) && !flags.contains(.connectionRequired)
    }
}

#endif
