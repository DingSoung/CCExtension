//  Created by Songwen Ding on 2017/7/26.
//  Copyright © 2017年 DingSoung. All rights reserved.

import Foundation
public final class Association<T: Any> {
    private let policy: objc_AssociationPolicy
    /// - Parameter policy: An association policy that will be used when linking objects.
    public init(policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC) {
        self.policy = policy
    }
    /// - Parameter index: An object whose associated object is to be accessed.
    public subscript(index: Any) -> T? {
        get {return objc_getAssociatedObject(index, Unmanaged.passUnretained(self).toOpaque()) as? T}
        set { objc_setAssociatedObject(index, Unmanaged.passUnretained(self).toOpaque(), newValue, policy) }
    }
}
