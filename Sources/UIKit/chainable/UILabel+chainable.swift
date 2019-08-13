//
//  CGSize+Float.swift
//  Extension
//
//  Created by Songwen Ding on 2019/5/30.
//  Copyright © 2019 DingSoung. All rights reserved.
//

#if canImport(UIKit)
import UIKit

extension UILabel {
    public func text(_ value: String?) -> Self {
        text = value
        return self
    }
    public func font(_ value: UIFont) -> Self {
        font = font
        return self
    }
    public func textColor(_ value: UIColor) -> Self {
        textColor = value
        return self
    }
    public func shadowColor(_ value: UIColor?) -> Self {
        shadowColor = value
        return self
    }
    public func shadowOffset(_ value: CGSize) -> Self {
        shadowOffset = value
        return self
    }
    public func textAlignment(_ value: NSTextAlignment) -> Self {
        textAlignment = value
        return self
    }
    public func lineBreakMode(_ value: NSLineBreakMode) -> Self {
        lineBreakMode = value
        return self
    }
    public func attributedText(_ value: NSAttributedString?) -> Self {
        attributedText = value
        return self
    }
    public func highlightedTextColor(_ value: UIColor?) -> Self {
        highlightedTextColor = value
        return self
    }
    public func isHighlighted(_ value: Bool) -> Self {
        isHighlighted = value
        return self
    }
    public func isUserInteractionEnabled(_ value: Bool) -> Self {
        isUserInteractionEnabled = value
        return self
    }
    public func isEnabled(_ value: Bool) -> Self {
        isEnabled = value
        return self
    }
    public func numberOfLines(_ value: Int) -> Self {
        numberOfLines = value
        return self
    }
    public func adjustsFontSizeToFitWidth(_ value: Bool) -> Self {
        adjustsFontSizeToFitWidth = value
        return self
    }
    public func baselineAdjustment(_ value: UIBaselineAdjustment) -> Self {
        baselineAdjustment = value
        return self
    }
    public func minimumScaleFactor(_ value: CGFloat) -> Self {
        minimumScaleFactor = value
        return self
    }
    @available(iOS 9.0, *)
    public func allowsDefaultTighteningForTruncation(_ value: Bool) -> Self {
        allowsDefaultTighteningForTruncation = value
        return self
    }
    public func preferredMaxLayoutWidth(_ value: CGFloat) -> Self {
        preferredMaxLayoutWidth = value
        return self
    }
}
#endif
