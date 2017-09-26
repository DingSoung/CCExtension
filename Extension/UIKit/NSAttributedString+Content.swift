//  Created by Songwen Ding on 4/9/16.
//  Copyright © 2016 DingSoung. All rights reserved.

#if os(iOS)
import UIKit
@objc
extension NSAttributedString {

    /// height for limit width with font
    public func height(constrainedWidth: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: constrainedWidth, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                            context: nil)
        return ceil(boundingBox.height)
    }

    /// width for limit height with font
    public func width(constrainedHeight: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: constrainedHeight)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                            context: nil)
        return ceil(boundingBox.width)
    }
}
#endif
