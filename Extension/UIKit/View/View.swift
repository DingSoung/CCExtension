//  Created by Songwen on 2018/11/13.
//  Copyright © 2018 DingSoung. All rights reserved.

#if canImport(UIKit) && os(iOS)
import UIKit
public typealias View = UIView
#endif

#if canImport(Cocoa)
import Cocoa
public typealias View = NSView
#endif
