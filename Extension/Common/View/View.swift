//  Created by Songwen on 2018/11/13.
//  Copyright © 2018 DingSoung. All rights reserved.

#if canImport(UIKit) && !os(watchOS)
import UIKit
public typealias View = UIView
#endif

#if canImport(AppKit)
import AppKit
public typealias View = NSView
#endif
