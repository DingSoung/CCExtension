//  Created by Songwen Ding on 8/25/16.
//  Copyright © 2016 DingSoung. All rights reserved.

import UIKit

extension UIImage {
    
    /// render image with Core Graphics or UIBezierPath code
    public class func image(code:()->Void, size:CGSize, opaque:Bool) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, opaque, UIScreen.main.scale)
        code()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
