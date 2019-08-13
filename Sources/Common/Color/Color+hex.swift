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
        if let cache = Color.association[self] {
            return cache
        } else {
            let cache = NSCache<NSString, Color>()
            cache.countLimit = 1024 // 1K
            cache.totalCostLimit = 0 // no limit
            cache.evictsObjectsWithDiscardedContent = true
            Color.association[self] = cache
            return cache
        }
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
    public class final func hex(_ name: String) -> Color? {
        if let color = Color.memoryCache.object(forKey: name as NSString) {
            return color
        }
        let formatHex = (name as NSString).replacingOccurrences(of: "#", with: "").uppercased()
        var alpha: CGFloat = 0
        var red: CGFloat = 0
        var blue: CGFloat = 0
        var green: CGFloat = 0
        switch formatHex.count {
        case 3: //#RGB
            alpha = 1
            red = colorComponent(hex: formatHex, start: 0, lenght: 1)
            green = colorComponent(hex: formatHex, start: 1, lenght: 1)
            blue = colorComponent(hex: formatHex, start: 2, lenght: 1)
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
        Color.memoryCache.setObject(color, forKey: name as NSString)
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

#endif
