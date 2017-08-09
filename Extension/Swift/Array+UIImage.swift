//  Created by Songwen Ding on 2017/8/9.
//  Copyright © 2017年 DingSoung. All rights reserved.

import UIKit

extension Array where Element:UIImage {
    
    public var verticalImage: UIImage? {
        var size = CGSize.zero
        for image in self {
            let sz = image.size
            size.height += sz.height
            size.width = Swift.max(size.width, sz.width)
        }
        var image: UIImage?
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        var y:CGFloat = 0
        for image in self {
            image.draw(at: CGPoint(x: 0, y: y))
            y += image.size.height
        }
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return image;
    }
}

extension NSArray {
    
    public var verticalImage: UIImage? {
        return (self as? [UIImage])?.verticalImage
    }
}
