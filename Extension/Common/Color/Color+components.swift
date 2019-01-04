//  Created by Songwen on 2018/11/7.
//  Copyright © 2018 DingSoung. All rights reserved.

#if canImport(CoreGraphics)
import CoreGraphics
#endif

#if !os(Linux)
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
#endif
