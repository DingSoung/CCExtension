//  Created by Songwen Ding on 2016/7/18.
//  Copyright © 2019 DingSoung. All rights reserved.

#if canImport(SystemConfiguration)
import SystemConfiguration

extension SCNetworkReachability {

    public class func reachability(hostName: String) -> SCNetworkReachability? {
        return SCNetworkReachabilityCreateWithName(kCFAllocatorDefault, hostName)
    }

    public class func reachability(hostAddress: inout sockaddr_in) -> SCNetworkReachability? {
        return withUnsafePointer(to: &hostAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, $0)
            }
        })
    }

    public class var reachabilityForInternetConnection: SCNetworkReachability? {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        return reachability(hostAddress: &zeroAddress)
    }
}
#endif
