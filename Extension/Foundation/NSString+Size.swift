//  Created by Songwen Ding on 12/15/15.
//  Copyright © 2015 DingSoung. All rights reserved.

import Foundation
import CoreGraphics
import UIKit

extension NSString {
    
    /*
    /// lenght with encode，English 中文 國語 日本語の 😀, GB_2312_80
    public func length(encode:CFStringEncodings) -> Int {
        let enc = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(encode.rawValue))
        guard let da = self.data(using: enc) else {
            return 0
        }
        return da.count
    }*/
    
    /// height for limit width with font
    public func height(constrainedWidth: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: constrainedWidth, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return boundingBox.height
    }
    
    /// width for limit height with font
    public func width(constrainedHeight: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: constrainedHeight)
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return boundingBox.width
    }
}


