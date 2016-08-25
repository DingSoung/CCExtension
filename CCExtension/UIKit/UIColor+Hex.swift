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
    
    /// init color with RGB
    public convenience init(red: Int, green: Int, blue: Int) {
        let r = red & 0xFF
        let g = green & 0xFF
        let b = blue & 0xFF
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1.0)
    }
    
    /// init color with hex like 0xFF55AA
    public convenience init(hex:Int) {
        self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff)
    }
}
