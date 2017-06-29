//  Created by Songwen Ding on 12/15/15.
//  Copyright © 2015 DingSoung. All rights reserved.

import Foundation
import CoreGraphics
import UIKit

extension NSString {
    
    /// lenght with encode，English 中文 國語 日本語の 😀, GB_2312_80
    public func length(encode:CFStringEncodings) -> Int {
        let enc = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(encode.rawValue))
        guard let da = self.data(using: enc) else {
            return 0
        }
        return da.count
    }
    
    /// height for limit width with font
    public func height(constrainedWidth: CGFloat, font: UIFont) -> CGFloat {
        return self.boundingRect(with: CGSize(width: constrainedWidth, height: CGFloat.greatestFiniteMagnitude),
                                 options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                 attributes: [NSFontAttributeName: font],
                                 context: nil).height
    }
    
    /// width for limit height with font
    public func width(constrainedHeight: CGFloat, font: UIFont) -> CGFloat {
        return self.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: constrainedHeight),
                                 options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                 attributes:  [NSFontAttributeName: font],
                                 context: nil).width
    }
}


