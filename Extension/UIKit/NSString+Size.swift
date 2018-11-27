//  Created by Songwen Ding on 12/15/15.
//  Copyright © 2015 DingSoung. All rights reserved.

import Foundation
import CoreGraphics

#if os(watchOS)
import UIKit

extension NSString {
    /// lenght with encode，English 中文 國語 日本語の 😀, GB_2312_80
    public func length(encode: CFStringEncodings) -> Int {
        let enc = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(encode.rawValue))
        guard let dat = data(using: enc) else {
            return 0
        }
        return dat.count
    }

    /// height for limit width with font
    public func height(constrainedWidth: CGFloat, font: UIFont) -> CGFloat {
        return boundingRect(with: CGSize(width: constrainedWidth, height: CGFloat.greatestFiniteMagnitude),
                                 options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                 attributes: [NSAttributedString.Key.font: font],
                                 context: nil).height
    }

    /// width for limit height with font
    public func width(constrainedHeight: CGFloat, font: UIFont) -> CGFloat {
        return boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: constrainedHeight),
                                 options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                 attributes: [NSAttributedString.Key.font: font],
                                 context: nil).width
    }
}
#endif
