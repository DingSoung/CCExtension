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
    @discardableResult
    public func backgroundColor(_ value: Color?) -> Self {
        backgroundColor = value
        return self
    }
    @discardableResult
    public func clipsToBounds(_ value: Bool) -> Self {
        clipsToBounds = value
        return self
    }
    @discardableResult
    public func alpha(_ value: CGFloat) -> Self {
        alpha = value
        return self
    }
    @discardableResult
    public func isOpaque(_ value: Bool) -> Self {
        isOpaque = value
        return self
    }
    @discardableResult
    public func isHidden(_ value: Bool) -> Self {
        isHidden = value
        return self
    }
    @discardableResult
    public func contentMode(_ value: ContentMode) -> Self {
        contentMode = value
        return self
    }
    @discardableResult
    public func mask(_ value: View?) -> Self {
        mask = value
        return self
    }
    @discardableResult
    public func tintColor(_ value: Color) -> Self {
        tintColor = value
        return self
    }
    @discardableResult
    public func tintAdjustmentMode(_ value: TintAdjustmentMode) -> Self {
        tintAdjustmentMode = value
        return self
    }
    @discardableResult
    public func frame(_ value: CGRect) -> Self {
        frame = value
        return self
    }
    @discardableResult
    @objc public func bounds(_ value: CGRect) -> Self {
        bounds = value
        return self
    }
    @discardableResult
    public func center(_ value: CGPoint) -> Self {
        center = value
        return self
    }
    @discardableResult
    public func transform(_ value: CGAffineTransform) -> Self {
        transform = value
        return self
    }
    
    @available(iOS 13.0, tvOS 13.0, *)
    @discardableResult
    public func transform3D(_ value: CATransform3D) -> Self {
        transform3D = value
        return self
    }
    @discardableResult
    public func contentScaleFactor(_ value: CGFloat) -> Self {
        contentScaleFactor = value
        return self
    }

    @available(iOS 8.0, *)
    @discardableResult
    public func layoutMargins(_ value: UIEdgeInsets) -> Self {
        layoutMargins = value
        return self
    }
    
    @available(iOS 11.0, tvOS 11.0, *)
    @discardableResult
    public func directionalLayoutMargins(_ value: NSDirectionalEdgeInsets) -> Self {
        directionalLayoutMargins = value
        return self
    }

    @available(iOS 8.0, *)
    @discardableResult
    public func preservesSuperviewLayoutMargins(_ value: Bool) -> Self {
        preservesSuperviewLayoutMargins = value
        return self
    }

    @available(iOS 11.0, tvOS 11.0, *)
    @discardableResult
    public func insetsLayoutMarginsFromSafeArea(_ value: Bool) -> Self {
        insetsLayoutMarginsFromSafeArea = value
        return self
    }
    
    @available(iOS 6.0, *)
    @discardableResult
    public func translatesAutoresizingMaskIntoConstraints(_ value: Bool) -> Self {
        translatesAutoresizingMaskIntoConstraints = value
        return self
    }
    @discardableResult
    public func isUserInteractionEnabled(_ value: Bool) -> Self {
        isUserInteractionEnabled = value
        return self
    }
    @discardableResult
    public func tag(_ value: Int) -> Self {
        tag = value
        return self
    }
    
    @available(iOS 9.0, *)
    @discardableResult
    public func semanticContentAttribute(_ value: UISemanticContentAttribute) -> Self {
        semanticContentAttribute = value
        return self
    }
}
#endif
