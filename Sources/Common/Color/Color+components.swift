//  Created by Songwen on 2018/11/7.
//  Copyright © 2018 DingSoung. All rights reserved.

#if canImport(UIKit)
import UIKit

extension Color {
    public struct FloatPath {
        var red: CGFloat
        var green: CGFloat
        var blue: CGFloat
        var alpha: CGFloat
    }

    public var components: FloatPath {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return FloatPath(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension Color {
    /// convert UIColor to hex number, 0xFF4477AA
    public final var hex8: UInt {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (UInt)(red * 0xFF) << 24
            | (UInt)(green * 0xFF) << 16
            | (UInt)(blue * 0xFF) << 8
            | (UInt)(alpha * 0xFF) << 0
    }

    /// convert UIColor to hex number, 0xFF4477AA
    public final var hex6: UInt {
        return hex8 & 0xFFFFFF00 >> 8
    }
}

extension Color {
    /// convert UIColor to hex string "#FF4477AA"
    public final var hex8String: String {
        return String(format: "#%08x", self.hex8)
    }

    /// convert UIColor to hex string "#FF4477AA"
    public final var hex6String: String {
        return String(format: "#%08x", self.hex6)
    }
}
#endif
