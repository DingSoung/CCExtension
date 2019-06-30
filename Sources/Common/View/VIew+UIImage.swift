//  Created by Songwen Ding on 15/5/27.
//  Copyright (c) 2015年 DingSoung. All rights reserved.

#if canImport(UIKit) && os(iOS)
import UIKit

extension View {
    ///  capture image, Compatible, alpha
    public func image(alpha: CGFloat, bounds: CGRect, scale: CGFloat) -> Image? {
        return Image.image(render: {
            if let context = UIGraphicsGetCurrentContext() {
                context.saveGState()
                context.setAlpha(alpha)
                context.concatenate(CGAffineTransform(translationX: bounds.origin.x,
                                                      y: bounds.origin.y).inverted())
                layer.render(in: context)
                context.restoreGState()
            }
        }, size: bounds.size, opaque: isOpaque)
    }
    public func image(scale: CGFloat) -> Image? {
        return Image.image(render: {
            if let contex = UIGraphicsGetCurrentContext() {
                layer.render(in: contex)
            }
        }, size: bounds.size, opaque: isOpaque)
    }
    public var image: Image? {
        return image(scale: UIScreen.main.scale)
    }
    public var fastImage: Image? {
        var image: Image?
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, UIScreen.main.scale)
        drawHierarchy(in: bounds, afterScreenUpdates: false)
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
#endif
