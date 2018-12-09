//  Created by Songwen on 2018/11/7.
//  Copyright © 2018 DingSoung. All rights reserved.

#if canImport(Foundation)
import Foundation
#endif

#if canImport(CoreGraphics)
import CoreGraphics
#endif

#if !os(Linux)
extension Color {
    private static let association = Association<NSCache<NSString, Color>>()
    public class final var memoryCache: NSCache<NSString, Color> {
        return Color.association[self] ?? {
            let cache = NSCache<NSString, Color>()
            cache.countLimit = 1024 // 1K
            cache.totalCostLimit = 0 // no limit
            cache.evictsObjectsWithDiscardedContent = true
            return cache
            }()
    }

    private class final func colorComponent(hex: String, start: Int, lenght: Int) -> CGFloat {
        let range = hex.index(hex.startIndex, offsetBy: start) ..< hex.index(hex.startIndex, offsetBy: start + lenght)
        let subString = hex[range]
        let fulHex = lenght == 2 ? subString : subString + subString
        var hexComponent: UInt32 = 0
        Scanner(string: String(fulHex)).scanHexInt32(&hexComponent)
        return CGFloat(hexComponent) / 255.0
    }

    /// convert hex to UIColor #RGB, #ARGB, #RRGGBB, #AARRGGBB
    public class final func color(hex: String) -> Color? {
        if let color = Color.memoryCache.object(forKey: hex as NSString) {
            return color
        }
        let formatHex = (hex as NSString).replacingOccurrences(of: "#", with: "").uppercased()
        var alpha: CGFloat = 0
        var red: CGFloat = 0
        var blue: CGFloat = 0
        var green: CGFloat = 0
        switch formatHex.count {
        case 3: //#RGB
            alpha = 1
            red = colorComponent(hex: formatHex, start: 0, lenght: 1)
            green = colorComponent(hex: formatHex, start: 1, lenght: 1)
            blue = self.colorComponent(hex: formatHex, start: 2, lenght: 1)
        case 4: //#ARGB
            alpha = colorComponent(hex: formatHex, start: 0, lenght: 1)
            red = colorComponent(hex: formatHex, start: 1, lenght: 1)
            green = colorComponent(hex: formatHex, start: 2, lenght: 1)
            blue = colorComponent(hex: formatHex, start: 3, lenght: 1)
        case 6: //#RRGGBB
            alpha = 1
            red = colorComponent(hex: formatHex, start: 0, lenght: 2)
            green = colorComponent(hex: formatHex, start: 2, lenght: 2)
            blue = colorComponent(hex: formatHex, start: 4, lenght: 2)
        case 8: //#AARRGGBB
            alpha = colorComponent(hex: formatHex, start: 0, lenght: 2)
            red = colorComponent(hex: formatHex, start: 2, lenght: 2)
            green = colorComponent(hex: formatHex, start: 4, lenght: 2)
            blue = colorComponent(hex: formatHex, start: 6, lenght: 2)
        default:
            return nil
        }
        let color = Color(red: red, green: green, blue: blue, alpha: alpha)
        Color.memoryCache.setObject(color, forKey: hex as NSString)
        return color
    }
}

extension Color {
    /// init color with hex like 0xFF55AABB
    public convenience init(hex8: UInt) {
        self.init(red: (hex8 >> 24) & 0xFF,
                  green: (hex8 >> 16) & 0xFF,
                  blue: (hex8 >> 8) & 0xFF,
                  alpha: hex8 & 0xFF)
    }

    /// init color with hex like 0xFF55AA
    public convenience init(hex6: UInt) {
        self.init(hex8: hex6 << 8 + 0xFF)
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
