//
//  CGSize+Float.swift
//  Extension
//
//  Created by Songwen Ding on 2019/5/30.
//  Copyright © 2019 DingSoung. All rights reserved.
//

#if canImport(UIKit)
import UIKit

extension View {
    public func backgroundColor(_ value: Color) -> Self {
        backgroundColor = value
        return self
    }
    public func clipsToBounds(_ value: Bool) -> Self {
        clipsToBounds = value
        return self
    }
    public func alpha(_ value: CGFloat) -> Self {
        alpha = value
        return self
    }
    public func isOpaque(_ value: Bool) -> Self {
        isOpaque = value
        return self
    }
    public func isHidden(_ value: Bool) -> Self {
        isHidden = value
        return self
    }
    public func contentMode(_ value: ContentMode) -> Self {
        contentMode = value
        return self
    }
    public func mask(_ value: View?) -> Self {
        mask = value
        return self
    }
    public func tintColor(_ value: Color) -> Self {
        tintColor = value
        return self
    }
    public func tintAdjustmentMode(_ value: TintAdjustmentMode) -> Self {
        tintAdjustmentMode = value
        return self
    }
    public func frame(_ value: CGRect) -> Self {
        frame = value
        return self
    }
    public func bounds(_ value: CGRect) -> Self {
        bounds = value
        return self
    }
    public func center(_ value: CGPoint) -> Self {
        center = value
        return self
    }
    public func transform(_ value: CGAffineTransform) -> Self {
        transform = value
        return self
    }
    public func contentScaleFactor(_ value: CGFloat) -> Self {
        contentScaleFactor = value
        return self
    }
}

extension View {
    open func subview(_ view: UIView) -> Self {
        addSubview(view)
        return self
    }
}
#endif
