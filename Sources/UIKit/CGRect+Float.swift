//
//  CGRect+Float.swift
//  Extension
//
//  Created by Songwen Ding on 2019/5/30.
//  Copyright © 2019 DingSoung. All rights reserved.
//

#if canImport(CoreGraphics)
import CoreGraphics

extension CGRect {
    public init(x: Float, y: Float, width: Float, height: Float) {
        self = CGRect(x: CGFloat(x), y: CGFloat(y), width: CGFloat(width), height: CGFloat(height))
    }
}
#endif
