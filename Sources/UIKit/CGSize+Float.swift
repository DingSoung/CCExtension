//
//  CGSize+Float.swift
//  Extension
//
//  Created by Songwen Ding on 2019/5/30.
//  Copyright © 2019 DingSoung. All rights reserved.
//

#if canImport(CoreGraphics)
import CoreGraphics

extension CGSize {
    public init(width: Float, height: Float) {
        self = CGSize(width: CGFloat(width), height: CGFloat(height))
    }
}
#endif
