//
//  NSAttributedString+Tools.swift
//  CCKit
//
//  Created by Songwen Ding on 4/9/16.
//  Copyright © 2016 DingSoung. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

extension NSAttributedString {
    
    /// height for limit width with font
    public func heightWithConstrainedWidth(width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.max)
        let boundingBox = self.boundingRectWithSize(constraintRect, options: NSStringDrawingOptions.UsesLineFragmentOrigin, context: nil)
        return ceil(boundingBox.height)
    }
    
    /// width for limit height with font
    public func widthWithConstrainedHeight(height: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: CGFloat.max, height: height)
        let boundingBox = self.boundingRectWithSize(constraintRect, options: NSStringDrawingOptions.UsesLineFragmentOrigin, context: nil)
        return ceil(boundingBox.width)
    }
}