//  Created by Songwen Ding on 8/25/16.
//  Copyright © 2016 DingSoung. All rights reserved.

import UIKit

extension UIImage {
    
    /// render image with Core Graphics or UIBezierPath code
    public class func image(render:()->Void, size:CGSize, opaque:Bool) -> UIImage? {
        return autoreleasepool { () -> UIImage? in
            var image: UIImage?
            UIGraphicsBeginImageContextWithOptions(size, opaque, UIScreen.main.scale)
            if let context = UIGraphicsGetCurrentContext() {
                UIGraphicsPushContext(context)
                render()
                UIGraphicsPopContext()
                image = UIGraphicsGetImageFromCurrentImageContext()
            }
            UIGraphicsEndImageContext()
            return image
        }
    }
}
