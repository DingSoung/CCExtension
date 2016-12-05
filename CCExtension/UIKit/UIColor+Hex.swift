//  Created by SongWen Ding on 6/13/14.
//  Copyright (c) 2015 DingSoung. All rights reserved.

import UIKit

extension UIColor {
    
    /// get Red Green Blue and Alpha from Color
    public var components:(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return (r,g,b,a)
    }
    
    /// init color with RGBA Hex 0x00 ~ 0xFF
    public convenience init(r: Int, g: Int, b: Int, a:Int) {
        self.init(red:CGFloat(r & 0xFF) / 255.0,
                  green:CGFloat(g & 0xFF) / 255.0,
                  blue:CGFloat(b & 0xFF) / 255.0,
                  alpha:CGFloat(a & 0xFF) / 255.0)
    }
    
    /// init color with hex like 0xFF55AA
    public convenience init(hex6:Int) {
        self.init(r:(hex6 >> 16) & 0xff, g:(hex6 >> 8) & 0xff, b:hex6 & 0xff, a:0xFF)
    }
    
    /// init color with hex like 0xFF55AABB
    public convenience init(hex8:Int) {
        self.init(r:(hex8 >> 24) & 0xff, g:(hex8 >> 16) & 0xff, b:(hex8 >> 8) & 0xff, a:hex8 & 0xff)
    }
}
