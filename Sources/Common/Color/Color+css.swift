//  Created by Songwen Ding on 2019/6/6.
//  Copyright © 2019 DingSoung. All rights reserved.
//

#if canImport(UIKit)
import UIKit

/*
extension Color: ExpressibleByIntegerLiteral {
    public typealias IntegerLiteralType = UInt
    public init(integerLiteral value: UInt)
public static let )self(hex6: value)
    }
}
 */

extension Color {
    public static let aliceblue = Color(hex6: 0xF0F8FF)
    public static let antiquewhite = Color(hex6: 0xFAEBD7)
    public static let aqua = Color(hex6: 0x00FFFF)
    public static let aquamarine = Color(hex6: 0x7FFFD4)
    public static let azure = Color(hex6: 0xF0FFFF)
    public static let beige = Color(hex6: 0xF5F5DC)
    public static let bisque = Color(hex6: 0xFFE4C4)
    //public static let black = Color(hex6: 0x000000)
    public static let blanchedalmond = Color(hex6: 0xFFEBCD)
    //public static let blue = Color(hex6: 0x0000FF)
    public static let blueviolet = Color(hex6: 0x8A2BE2)
    //public static let brown = Color(hex6: 0xA52A2A)
    public static let burlywood = Color(hex6: 0xDEB887)
    public static let cadetblue = Color(hex6: 0x5F9EA0)
    public static let chartreuse = Color(hex6: 0x7FFF00)
    public static let chocolate = Color(hex6: 0xD2691E)
    public static let coral = Color(hex6: 0xFF7F50)
    public static let cornflowerblue = Color(hex6: 0x6495ED)
    public static let cornsilk = Color(hex6: 0xFFF8DC)
    public static let crimson = Color(hex6: 0xDC143C)
    //public static let cyan = Color(hex6: 0x00FFFF)
    public static let darkblue = Color(hex6: 0x00008B)
    public static let darkcyan = Color(hex6: 0x008B8B)
    public static let darkgoldenrod = Color(hex6: 0xB8860B)
    public static let darkgray = Color(hex6: 0xA9A9A9)
    public static let darkgreen = Color(hex6: 0x006400)
    public static let darkkhaki = Color(hex6: 0xBDB76B)
    public static let darkmagenta = Color(hex6: 0x8B008B)
    public static let darkolivegreen = Color(hex6: 0x556B2F)
    public static let darkorange = Color(hex6: 0xFF8C00)
    public static let darkorchid = Color(hex6: 0x9932CC)
    public static let darkred = Color(hex6: 0x8B0000)
    public static let darksalmon = Color(hex6: 0xE9967A)
    public static let darkseagreen = Color(hex6: 0x8FBC8F)
    public static let darkslateblue = Color(hex6: 0x483D8B)
    public static let darkslategray = Color(hex6: 0x2F4F4F)
    public static let darkturquoise = Color(hex6: 0x00CED1)
    public static let darkviolet = Color(hex6: 0x9400D3)
    public static let deeppink = Color(hex6: 0xFF1493)
    public static let deepskyblue = Color(hex6: 0x00BFFF)
    public static let dimgray = Color(hex6: 0x696969)
    public static let dodgerblue = Color(hex6: 0x1E90FF)
    public static let firebrick = Color(hex6: 0xB22222)
    public static let floralwhite = Color(hex6: 0xFFFAF0)
    public static let forestgreen = Color(hex6: 0x228B22)
    public static let fuchsia = Color(hex6: 0xFF00FF)
    public static let gainsboro = Color(hex6: 0xDCDCDC)
    public static let ghostwhite = Color(hex6: 0xF8F8FF)
    public static let gold = Color(hex6: 0xFFD700)
    public static let goldenrod = Color(hex6: 0xDAA520)
    //public static let gray = Color(hex6: 0x7F7F7F)
    //public static let green = Color(hex6: 0x008000)
    public static let greenyellow = Color(hex6: 0xADFF2F)
    public static let honeydew = Color(hex6: 0xF0FFF0)
    public static let hotpink = Color(hex6: 0xFF69B4)
    public static let indianred = Color(hex6: 0xCD5C5C)
    public static let indigo = Color(hex6: 0x4B0082)
    public static let ivory = Color(hex6: 0xFFFFF0)
    public static let khaki = Color(hex6: 0xF0E68C)
    public static let lavender = Color(hex6: 0xE6E6FA)
    public static let lavenderblush = Color(hex6: 0xFFF0F5)
    public static let lawngreen = Color(hex6: 0x7CFC00)
    public static let lemonchiffon = Color(hex6: 0xFFFACD)
    public static let lightblue = Color(hex6: 0xADD8E6)
    public static let lightcoral = Color(hex6: 0xF08080)
    public static let lightcyan = Color(hex6: 0xE0FFFF)
    public static let lightgoldenrodyellow = Color(hex6: 0xFAFAD2)
    public static let lightgreen = Color(hex6: 0x90EE90)
    public static let lightgrey = Color(hex6: 0xD3D3D3)
    public static let lightpink = Color(hex6: 0xFFB6C1)
    public static let lightsalmon = Color(hex6: 0xFFA07A)
    public static let lightseagreen = Color(hex6: 0x20B2AA)
    public static let lightskyblue = Color(hex6: 0x87CEFA)
    public static let lightslategray = Color(hex6: 0x778899)
    public static let lightsteelblue = Color(hex6: 0xB0C4DE)
    public static let lightyellow = Color(hex6: 0xFFFFE0)
    public static let lime = Color(hex6: 0x00FF00)
    public static let limegreen = Color(hex6: 0x32CD32)
    public static let linen = Color(hex6: 0xFAF0E6)
    //public static let magenta = Color(hex6: 0xFF00FF)
    public static let maroon = Color(hex6: 0x800000)
    public static let mediumaquamarine = Color(hex6: 0x66CDAA)
    public static let mediumblue = Color(hex6: 0x0000CD)
    public static let mediumorchid = Color(hex6: 0xBA55D3)
    public static let mediumpurple = Color(hex6: 0x9370DB)
    public static let mediumseagreen = Color(hex6: 0x3CB371)
    public static let mediumslateblue = Color(hex6: 0x7B68EE)
    public static let mediumspringgreen = Color(hex6: 0x00FA9A)
    public static let mediumturquoise = Color(hex6: 0x48D1CC)
    public static let mediumvioletred = Color(hex6: 0xC71585)
    public static let midnightblue = Color(hex6: 0x191970)
    public static let mintcream = Color(hex6: 0xF5FFFA)
    public static let mistyrose = Color(hex6: 0xFFE4E1)
    public static let moccasin = Color(hex6: 0xFFE4B5)
    public static let navajowhite = Color(hex6: 0xFFDEAD)
    public static let navy = Color(hex6: 0x000080)
    public static let navyblue = Color(hex6: 0x9FAFDF)
    public static let oldlace = Color(hex6: 0xFDF5E6)
    public static let olive = Color(hex6: 0x808000)
    public static let olivedrab = Color(hex6: 0x6B8E23)
    //public static let orange = Color(hex6: 0xFFA500)
    public static let orangered = Color(hex6: 0xFF4500)
    public static let orchid = Color(hex6: 0xDA70D6)
    public static let palegoldenrod = Color(hex6: 0xEEE8AA)
    public static let palegreen = Color(hex6: 0x98FB98)
    public static let paleturquoise = Color(hex6: 0xAFEEEE)
    public static let palevioletred = Color(hex6: 0xDB7093)
    public static let papayawhip = Color(hex6: 0xFFEFD5)
    public static let peachpuff = Color(hex6: 0xFFDAB9)
    public static let peru = Color(hex6: 0xCD853F)
    public static let pink = Color(hex6: 0xFFC0CB)
    public static let plum = Color(hex6: 0xDDA0DD)
    public static let powderblue = Color(hex6: 0xB0E0E6)
    //public static let purple = Color(hex6: 0x800080)
    //public static let red = Color(hex6: 0xFF0000)
    public static let rosybrown = Color(hex6: 0xBC8F8F)
    public static let royalblue = Color(hex6: 0x4169E1)
    public static let saddlebrown = Color(hex6: 0x8B4513)
    public static let salmon = Color(hex6: 0xFA8072)
    public static let sandybrown = Color(hex6: 0xFA8072)
    public static let seagreen = Color(hex6: 0x2E8B57)
    public static let seashell = Color(hex6: 0xFFF5EE)
    public static let sienna = Color(hex6: 0xA0522D)
    public static let silver = Color(hex6: 0xC0C0C0)
    public static let skyblue = Color(hex6: 0x87CEEB)
    public static let slateblue = Color(hex6: 0x6A5ACD)
    public static let slategray = Color(hex6: 0x708090)
    public static let snow = Color(hex6: 0xFFFAFA)
    public static let springgreen = Color(hex6: 0x00FF7F)
    public static let steelblue = Color(hex6: 0x4682B4)
    public static let tan = Color(hex6: 0xD2B48C)
    public static let teal = Color(hex6: 0x008080)
    public static let thistle = Color(hex6: 0xD8BFD8)
    public static let tomato = Color(hex6: 0xFF6347)
    public static let turquoise = Color(hex6: 0x40E0D0)
    public static let violet = Color(hex6: 0xEE82EE)
    public static let wheat = Color(hex6: 0xF5DEB3)
    //public static let white = Color(hex6: 0xFFFFFF)
    public static let whitesmoke = Color(hex6: 0xF5F5F5)
    //public static let yellow = Color(hex6: 0xFFFF00)
    public static let yellowgreen = Color(hex6: 0x9ACD32)


    static let map: [String: UInt] = [
        "aliceblue": 0xF0F8FF,
        "antiquewhite": 0xFAEBD7,
        "aqua": 0x00FFFF,
        "aquamarine": 0x7FFFD4,
        "azure": 0xF0FFFF,
        "beige": 0xF5F5DC,
        "bisque": 0xFFE4C4,
        "black": 0x000000,
        "blanchedalmond": 0xFFEBCD,
        "blue": 0x0000FF,
        "blueviolet": 0x8A2BE2,
        "brown": 0xA52A2A,
        "burlywood": 0xDEB887,
        "cadetblue": 0x5F9EA0,
        "chartreuse": 0x7FFF00,
        "chocolate": 0xD2691E,
        "coral": 0xFF7F50,
        "cornflowerblue": 0x6495ED,
        "cornsilk": 0xFFF8DC,
        "crimson": 0xDC143C,
        "cyan": 0x00FFFF,
        "darkblue": 0x00008B,
        "darkcyan": 0x008B8B,
        "darkgoldenrod": 0xB8860B,
        "darkgray": 0xA9A9A9,
        "darkgreen": 0x006400,
        "darkkhaki": 0xBDB76B,
        "darkmagenta": 0x8B008B,
        "darkolivegreen": 0x556B2F,
        "darkorange": 0xFF8C00,
        "darkorchid": 0x9932CC,
        "darkred": 0x8B0000,
        "darksalmon": 0xE9967A,
        "darkseagreen": 0x8FBC8F,
        "darkslateblue": 0x483D8B,
        "darkslategray": 0x2F4F4F,
        "darkturquoise": 0x00CED1,
        "darkviolet": 0x9400D3,
        "deeppink": 0xFF1493,
        "deepskyblue": 0x00BFFF,
        "dimgray": 0x696969,
        "dodgerblue": 0x1E90FF,
        "firebrick": 0xB22222,
        "floralwhite": 0xFFFAF0,
        "forestgreen": 0x228B22,
        "fuchsia": 0xFF00FF,
        "gainsboro": 0xDCDCDC,
        "ghostwhite": 0xF8F8FF,
        "gold": 0xFFD700,
        "goldenrod": 0xDAA520,
        "gray": 0x7F7F7F,
        "green": 0x008000,
        "greenyellow": 0xADFF2F,
        "honeydew": 0xF0FFF0,
        "hotpink": 0xFF69B4,
        "indianred": 0xCD5C5C,
        "indigo": 0x4B0082,
        "ivory": 0xFFFFF0,
        "khaki": 0xF0E68C,
        "lavender": 0xE6E6FA,
        "lavenderblush": 0xFFF0F5,
        "lawngreen": 0x7CFC00,
        "lemonchiffon": 0xFFFACD,
        "lightblue": 0xADD8E6,
        "lightcoral": 0xF08080,
        "lightcyan": 0xE0FFFF,
        "lightgoldenrodyellow": 0xFAFAD2,
        "lightgreen": 0x90EE90,
        "lightgrey": 0xD3D3D3,
        "lightpink": 0xFFB6C1,
        "lightsalmon": 0xFFA07A,
        "lightseagreen": 0x20B2AA,
        "lightskyblue": 0x87CEFA,
        "lightslategray": 0x778899,
        "lightsteelblue": 0xB0C4DE,
        "lightyellow": 0xFFFFE0,
        "lime": 0x00FF00,
        "limegreen": 0x32CD32,
        "linen": 0xFAF0E6,
        "magenta": 0xFF00FF,
        "maroon": 0x800000,
        "mediumaquamarine": 0x66CDAA,
        "mediumblue": 0x0000CD,
        "mediumorchid": 0xBA55D3,
        "mediumpurple": 0x9370DB,
        "mediumseagreen": 0x3CB371,
        "mediumslateblue": 0x7B68EE,
        "mediumspringgreen": 0x00FA9A,
        "mediumturquoise": 0x48D1CC,
        "mediumvioletred": 0xC71585,
        "midnightblue": 0x191970,
        "mintcream": 0xF5FFFA,
        "mistyrose": 0xFFE4E1,
        "moccasin": 0xFFE4B5,
        "navajowhite": 0xFFDEAD,
        "navy": 0x000080,
        "navyblue": 0x9FAFDF,
        "oldlace": 0xFDF5E6,
        "olive": 0x808000,
        "olivedrab": 0x6B8E23,
        "orange": 0xFFA500,
        "orangered": 0xFF4500,
        "orchid": 0xDA70D6,
        "palegoldenrod": 0xEEE8AA,
        "palegreen": 0x98FB98,
        "paleturquoise": 0xAFEEEE,
        "palevioletred": 0xDB7093,
        "papayawhip": 0xFFEFD5,
        "peachpuff": 0xFFDAB9,
        "peru": 0xCD853F,
        "pink": 0xFFC0CB,
        "plum": 0xDDA0DD,
        "powderblue": 0xB0E0E6,
        "purple": 0x800080,
        "red": 0xFF0000,
        "rosybrown": 0xBC8F8F,
        "royalblue": 0x4169E1,
        "saddlebrown": 0x8B4513,
        "salmon": 0xFA8072,
        "sandybrown": 0xFA8072,
        "seagreen": 0x2E8B57,
        "seashell": 0xFFF5EE,
        "sienna": 0xA0522D,
        "silver": 0xC0C0C0,
        "skyblue": 0x87CEEB,
        "slateblue": 0x6A5ACD,
        "slategray": 0x708090,
        "snow": 0xFFFAFA,
        "springgreen": 0x00FF7F,
        "steelblue": 0x4682B4,
        "tan": 0xD2B48C,
        "teal": 0x008080,
        "thistle": 0xD8BFD8,
        "tomato": 0xFF6347,
        "turquoise": 0x40E0D0,
        "violet": 0xEE82EE,
        "wheat": 0xF5DEB3,
        "white": 0xFFFFFF,
        "whitesmoke": 0xF5F5F5,
        "yellow": 0xFFFF00,
        "yellowgreen": 0x9ACD32,
    ]

    public class func css(_ name: String) -> Color? {
        if let raw = self.map[name] {
            return Color(hex6: raw)
        } else {
            return self.hex(name)
        }
    }
}

#endif
