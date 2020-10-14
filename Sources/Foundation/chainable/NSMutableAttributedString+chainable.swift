//
//  CGSize+Float.swift
//  Extension
//
//  Created by Songwen Ding on 2019/5/30.
//  Copyright © 2019 DingSoung. All rights reserved.
//

#if canImport(UIKit)
import UIKit

extension NSMutableAttributedString {
    @discardableResult
    private var range: NSRange {
        return NSRange(location: 0, length: length)
    }
    @discardableResult
    public func font(_ value: UIFont) -> Self {
        addAttribute(.font, value: value, range: range); return self
    }
    @discardableResult
    public func paragraphStyle(_ value: NSParagraphStyle) -> Self {
        addAttribute(.paragraphStyle, value: value, range: range); return self
    }
    @discardableResult
    public func foregroundColor(_ value: Color) -> Self {
        addAttribute(.foregroundColor, value: value, range: range); return self
    }
    @discardableResult
    public func backgroundColor(_ value: Color) -> Self {
        addAttribute(.backgroundColor, value: value, range: range); return self
    }
    @discardableResult
    public func ligature(_ value: Int) -> Self {
        addAttribute(.ligature, value: value, range: range); return self
    }
    @discardableResult
    public func kern(_ value: Float) -> Self {
        addAttribute(.kern, value: value, range: range); return self
    }
    @discardableResult
    public func strikethroughStyle(_ value: NSUnderlineStyle) -> Self {
        addAttribute(.strikethroughStyle, value: value.rawValue, range: range); return self
    }
    @discardableResult
    public func underlineStyle(_ value: NSUnderlineStyle) -> Self {
        addAttribute(.underlineStyle, value: value.rawValue, range: range); return self
    }
    @discardableResult
    public func strokeColor(_ value: Color) -> Self {
        addAttribute(.strokeColor, value: value, range: range); return self
    }
    @discardableResult
    public func strokeWidth(_ value: CGFloat) -> Self {
        addAttribute(.strokeWidth, value: value, range: range); return self
    }
    @discardableResult
    public func shadow(_ value: NSShadow) -> Self {
        addAttribute(.shadow, value: value, range: range); return self
    }
    @discardableResult
    public func textEffect(_ value: String) -> Self {
        addAttribute(.textEffect, value: value, range: range); return self
    }
    @discardableResult
    public func attachment(_ value: NSTextAttachment) -> Self {
        addAttribute(.attachment, value: value, range: range); return self
    }
    @discardableResult
    public func link(_ value: URL) -> Self {
        addAttribute(.link, value: value, range: range); return self
    }
    @discardableResult
    public func baselineOffset(_ value: CGFloat) -> Self {
        addAttribute(.baselineOffset, value: value, range: range); return self
    }
    @discardableResult
    public func underlineColor(_ value: Color) -> Self {
        addAttribute(.underlineColor, value: value, range: range); return self
    }
    @discardableResult
    public func strikethroughColor(_ value: Color) -> Self {
        addAttribute(.strikethroughColor, value: value, range: range); return self
    }
    @discardableResult
    public func obliqueness(_ value: CGFloat) -> Self {
        addAttribute(.obliqueness, value: value, range: range); return self
    }
    @discardableResult
    public func expansion(_ value: CGFloat) -> Self {
        addAttribute(.expansion, value: value, range: range); return self
    }
    @discardableResult
    public func writingDirection(_ value: [CGFloat]) -> Self {
        addAttribute(.writingDirection, value: value, range: range); return self
    }
    @discardableResult
    public func verticalGlyphForm(_ value: Int) -> Self {
        addAttribute(.verticalGlyphForm, value: value, range: range); return self
    }
}

#endif
