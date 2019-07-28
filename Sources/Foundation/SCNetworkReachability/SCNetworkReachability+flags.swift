//  Created by Songwen Ding on 2016/7/18.
//  Copyright © 2019 DingSoung. All rights reserved.

#if canImport(SystemConfiguration)
import SystemConfiguration

extension SCNetworkReachability {
    private var flags: SCNetworkReachabilityFlags {
        var networkReachabilityFlags: SCNetworkReachabilityFlags = []
        SCNetworkReachabilityGetFlags(self, &networkReachabilityFlags)
        return networkReachabilityFlags
    }

    public var connectionRequired: Bool {
        return self.flags.contains(.connectionRequired)
    }

    public var reachable: Bool {
        return self.flags.contains(.reachable)
    }

    public var isOnline: Bool {
        let flags = self.flags
        return flags.contains(.reachable) && !flags.contains(.connectionRequired)
    }

    public enum Status: Int {
        case notReachable = 0
        case reachableViaWiFi
        case reachableViaWWAN
    }

    public var status: Status {
        let flags = self.flags
        guard flags.contains(.reachable) else {
            return .notReachable
        }
        var ret: Status = .notReachable
        if flags.contains(.connectionRequired) == false {
            ret = .reachableViaWiFi
        }
        if flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic) {
            if flags.contains(.interventionRequired) == false {
                ret = .reachableViaWiFi
            }
        }
        if flags.contains(SCNetworkReachabilityFlags.isWWAN) {
            ret = .reachableViaWWAN
        }
        return ret
    }
}

#endif
