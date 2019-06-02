//
//  CGpoint+Float.swift
//  Extension
//
//  Created by Songwen Ding on 2019/5/30.
//  Copyright © 2019 DingSoung. All rights reserved.
//

import CoreGraphics

extension CGPoint {
    public init(x: Float, y: Float) {
        self = CGPoint(x: CGFloat(x), y: CGFloat(y))
    }
}
