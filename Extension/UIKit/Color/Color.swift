//  Created by Songwen on 2018/11/7.
//  Copyright © 2018 DingSoung. All rights reserved.

#if canImport(UIKit)
import UIKit
public typealias Color = UIColor
#endif

#if canImport(Cocoa)
import Cocoa
public typealias Color = NSColor
#endif

#if !os(watchOS)
import CoreImage
#endif
