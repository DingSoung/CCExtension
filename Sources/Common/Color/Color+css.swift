//  Created by Songwen Ding on 2019/6/6.
//  Copyright © 2019 DingSoung. All rights reserved.
//

#if canImport(UIKit)
import UIKit

extension Color {
    public static var black             = Color(hex6: 0x000000)
    public static var navy              = Color(hex6: 0x000080)
    public static var darkblue          = Color(hex6: 0x00008b)
    public static var mediumblue        = Color(hex6: 0x0000cd)
    public static var blue              = Color(hex6: 0x0000ff)
    public static var darkgreen         = Color(hex6: 0x006400)
    public static var green             = Color(hex6: 0x008000)
    public static var teal              = Color(hex6: 0x008080)
    public static var darkcyan          = Color(hex6: 0x008b8b)
    public static var deepskyblue       = Color(hex6: 0x00bfff)
    public static var darkturquoise     = Color(hex6: 0x00ced1)
    public static var mediumspringgreen = Color(hex6: 0x00fa9a)
    public static var lime              = Color(hex6: 0x00ff00)
    public static var springgreen       = Color(hex6: 0x00ff7f)
    public static var aqua              = Color(hex6: 0x00ffff)
    public static var cyan              = Color(hex6: 0x00ffff)
    public static var midnightblue      = Color(hex6: 0x191970)
    public static var dodgerblue        = Color(hex6: 0x1e90ff)
    public static var lightseagreen     = Color(hex6: 0x20b2aa)
    public static var forestgreen       = Color(hex6: 0x228b22)
    public static var seagreen          = Color(hex6: 0x2e8b57)
    public static var darkslategray     = Color(hex6: 0x2f4f4f)
    public static var darkslategrey     = Color(hex6: 0x2f4f4f)
    public static var limegreen         = Color(hex6: 0x32cd32)
    public static var mediumseagreen    = Color(hex6: 0x3cb371)
    public static var turquoise         = Color(hex6: 0x40e0d0)
    public static var royalblue         = Color(hex6: 0x4169e1)
    public static var steelblue         = Color(hex6: 0x4682b4)
    public static var darkslateblue     = Color(hex6: 0x483d8b)
    public static var mediumturquoise   = Color(hex6: 0x48d1cc)
    public static var indigo            = Color(hex6: 0x4b0082)
    public static var darkolivegreen    = Color(hex6: 0x556b2f)
    public static var cadetblue         = Color(hex6: 0x5f9ea0)
    public static var cornflowerblue    = Color(hex6: 0x6495ed)
    public static var rebeccapurple     = Color(hex6: 0x663399)
    public static var mediumaquamarine  = Color(hex6: 0x66cdaa)
    public static var dimgray           = Color(hex6: 0x696969)
    public static var dimgrey           = Color(hex6: 0x696969)
    public static var slateblue         = Color(hex6: 0x6a5acd)
    public static var olivedrab         = Color(hex6: 0x6b8e23)
    public static var slategray         = Color(hex6: 0x708090)
    public static var slategrey         = Color(hex6: 0x708090)
    public static var lightslategray    = Color(hex6: 0x778899)
    public static var lightslategrey    = Color(hex6: 0x778899)
    public static var mediumslateblue   = Color(hex6: 0x7b68ee)
    public static var lawngreen         = Color(hex6: 0x7cfc00)
    public static var chartreuse        = Color(hex6: 0x7fff00)
    public static var aquamarine        = Color(hex6: 0x7fffd4)
    public static var maroon            = Color(hex6: 0x800000)
    public static var purple            = Color(hex6: 0x800080)
    public static var olive             = Color(hex6: 0x808000)
    public static var gray              = Color(hex6: 0x808080)
    public static var grey              = Color(hex6: 0x808080)
    public static var skyblue           = Color(hex6: 0x87ceeb)
    public static var lightskyblue      = Color(hex6: 0x87cefa)
    public static var blueviolet        = Color(hex6: 0x8a2be2)
    public static var darkred           = Color(hex6: 0x8b0000)
    public static var darkmagenta       = Color(hex6: 0x8b008b)
    public static var saddlebrown       = Color(hex6: 0x8b4513)
    public static var darkseagreen      = Color(hex6: 0x8fbc8f)
    public static var lightgreen        = Color(hex6: 0x90ee90)
    public static var mediumpurple      = Color(hex6: 0x9370db)
    public static var darkviolet        = Color(hex6: 0x9400d3)
    public static var palegreen         = Color(hex6: 0x98fb98)
    public static var darkorchid        = Color(hex6: 0x9932cc)
    public static var yellowgreen       = Color(hex6: 0x9acd32)
    public static var sienna            = Color(hex6: 0xa0522d)
    public static var brown             = Color(hex6: 0xa52a2a)
    public static var darkgray          = Color(hex6: 0xa9a9a9)
    public static var darkgrey          = Color(hex6: 0xa9a9a9)
    public static var lightblue         = Color(hex6: 0xadd8e6)
    public static var greenyellow       = Color(hex6: 0xadff2f)
    public static var paleturquoise     = Color(hex6: 0xafeeee)
    public static var lightsteelblue    = Color(hex6: 0xb0c4de)
    public static var powderblue        = Color(hex6: 0xb0e0e6)
    public static var firebrick         = Color(hex6: 0xb22222)
    public static var darkgoldenrod     = Color(hex6: 0xb8860b)
    public static var mediumorchid      = Color(hex6: 0xba55d3)
    public static var rosybrown         = Color(hex6: 0xbc8f8f)
    public static var darkkhaki         = Color(hex6: 0xbdb76b)
    public static var silver            = Color(hex6: 0xc0c0c0)
    public static var mediumvioletred   = Color(hex6: 0xc71585)
    public static var indianred         = Color(hex6: 0xcd5c5c)
    public static var peru              = Color(hex6: 0xcd853f)
    public static var chocolate         = Color(hex6: 0xd2691e)
    public static var tan               = Color(hex6: 0xd2b48c)
    public static var lightgray         = Color(hex6: 0xd3d3d3)
    public static var lightgrey         = Color(hex6: 0xd3d3d3)
    public static var thistle           = Color(hex6: 0xd8bfd8)
    public static var orchid            = Color(hex6: 0xda70d6)
    public static var goldenrod         = Color(hex6: 0xdaa520)
    public static var palevioletred     = Color(hex6: 0xdb7093)
    public static var crimson           = Color(hex6: 0xdc143c)
    public static var gainsboro         = Color(hex6: 0xdcdcdc)
    public static var plum              = Color(hex6: 0xdda0dd)
    public static var burlywood         = Color(hex6: 0xdeb887)
    public static var lightcyan         = Color(hex6: 0xe0ffff)
    public static var lavender          = Color(hex6: 0xe6e6fa)
    public static var darksalmon        = Color(hex6: 0xe9967a)
    public static var violet            = Color(hex6: 0xee82ee)
    public static var palegoldenrod     = Color(hex6: 0xeee8aa)
    public static var lightcoral        = Color(hex6: 0xf08080)
    public static var khaki             = Color(hex6: 0xf0e68c)
    public static var aliceblue         = Color(hex6: 0xf0f8ff)
    public static var honeydew          = Color(hex6: 0xf0fff0)
    public static var azure             = Color(hex6: 0xf0ffff)
    public static var sandybrown        = Color(hex6: 0xf4a460)
    public static var wheat             = Color(hex6: 0xf5deb3)
    public static var beige             = Color(hex6: 0xf5f5dc)
    public static var whitesmoke        = Color(hex6: 0xf5f5f5)
    public static var mintcream         = Color(hex6: 0xf5fffa)
    public static var ghostwhite        = Color(hex6: 0xf8f8ff)
    public static var salmon            = Color(hex6: 0xfa8072)
    public static var antiquewhite      = Color(hex6: 0xfaebd7)
    public static var linen             = Color(hex6: 0xfaf0e6)
    public static var lightgoldenrodyellow        = Color(hex6: 0xfafad2)
    public static var oldlace           = Color(hex6: 0xfdf5e6)
    public static var red               = Color(hex6: 0xff0000)
    public static var fuchsia           = Color(hex6: 0xff00ff)
    public static var magenta           = Color(hex6: 0xff00ff)
    public static var deeppink          = Color(hex6: 0xff1493)
    public static var orangered         = Color(hex6: 0xff4500)
    public static var tomato            = Color(hex6: 0xff6347)
    public static var hotpink           = Color(hex6: 0xff69b4)
    public static var coral             = Color(hex6: 0xff7f50)
    public static var darkorange        = Color(hex6: 0xff8c00)
    public static var lightsalmon       = Color(hex6: 0xffa07a)
    public static var orange            = Color(hex6: 0xffa500)
    public static var lightpink         = Color(hex6: 0xffb6c1)
    public static var pink              = Color(hex6: 0xffc0cb)
    public static var gold              = Color(hex6: 0xffd700)
    public static var peachpuff         = Color(hex6: 0xffdab9)
    public static var navajowhite       = Color(hex6: 0xffdead)
    public static var moccasin          = Color(hex6: 0xffe4b5)
    public static var bisque            = Color(hex6: 0xffe4c4)
    public static var mistyrose         = Color(hex6: 0xffe4e1)
    public static var blanchedalmond    = Color(hex6: 0xffebcd)
    public static var papayawhip        = Color(hex6: 0xffefd5)
    public static var lavenderblush     = Color(hex6: 0xfff0f5)
    public static var seashell          = Color(hex6: 0xfff5ee)
    public static var cornsilk          = Color(hex6: 0xfff8dc)
    public static var lemonchiffon      = Color(hex6: 0xfffacd)
    public static var floralwhite       = Color(hex6: 0xfffaf0)
    public static var snow              = Color(hex6: 0xfffafa)
    public static var yellow            = Color(hex6: 0xffff00)
    public static var lightyellow       = Color(hex6: 0xffffe0)
    public static var ivory             = Color(hex6: 0xfffff0)
    public static var white             = Color(hex6: 0xffffff)

    /// init color with hex like red) #ABCDEF
    public class func css(_ name: String) -> Color? {
        if let color = self.value(forKey: name) as? Color {
            return color
        } else {
            return hex(name)
        }
    }
}

#endif
