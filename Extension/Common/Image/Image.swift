//  Created by Songwen Ding on 2019/1/4.
//  Copyright © 2019 DingSoung. All rights reserved.

import Foundation

#if canImport(UIKit)
import UIKit
public typealias Image = UIImage
#endif

#if canImport(AppKit)
import AppKit
public typealias Image = NSImage
#endif

#if !os(watchOS)
import CoreImage
#endif
