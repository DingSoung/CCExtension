//  Created by Songwen Ding on 2017/8/9.
//  Copyright © 2017年 DingSoung. All rights reserved.

#if canImport(UIKit)
import UIKit

extension Array where Element: UIImage {
    public func verticalImage(space: CGFloat, backgroundColor: UIColor?) -> UIImage? {
        var size = CGSize.zero
        for image in self {
            let imgSize = image.size
            size.height += imgSize.height
            size.width = Swift.max(size.width, imgSize.width)
        }
        size.height += CGFloat(Swift.max(0, self.count - 1)) * space
        var image: UIImage?
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        if let color = backgroundColor {
            let path = UIBezierPath(rect: CGRect(origin: CGPoint.zero, size: size))
            color.setFill()
            path.fill()
        }
        var imgY: CGFloat = 0
        for image in self {
            image.draw(at: CGPoint(x: 0, y: imgY))
            imgY += image.size.height
            imgY += space
        }
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

    public var verticalImage: UIImage? {
        return self.verticalImage(space: 0, backgroundColor: nil)
    }
}
#endif
