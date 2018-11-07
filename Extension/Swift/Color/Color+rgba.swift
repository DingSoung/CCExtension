//  Created by Songwen on 2018/11/7.
//  Copyright © 2018 DingSoung. All rights reserved.

#if canImport(CoreGraphics)
import CoreGraphics
#endif

#if !os(Linux)
extension Color {
    /// init color with RGBA Hex 0x00 ~ 0xFF
    public convenience init(red: Int, green: Int, blue: Int, alpha: Int) {
        self.init(red: CGFloat(red & 0xFF) / 255.0,
                  green: CGFloat(green & 0xFF) / 255.0,
                  blue: CGFloat(blue & 0xFF) / 255.0,
                  alpha: CGFloat(alpha & 0xFF) / 255.0)
    }
}
#endif
