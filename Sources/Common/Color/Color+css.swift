//  Created by Songwen Ding on 2019/6/6.
//  Copyright © 2019 DingSoung. All rights reserved.
//

#if canImport(UIKit)
import UIKit

extension Color {
    static var cssMap: [String: Color] = [
        "black" : black,
        "navy" : navy,
        "darkblue" : darkblue,
        "mediumblue" : mediumblue,
        "blue" : blue,
        "darkgreen" : darkgreen,
        "green" : green,
        "teal" : teal,
        "darkcyan" : darkcyan,
        "deepskyblue" : deepskyblue,
        "darkturquoise" : darkturquoise,
        "darkturquoise" : darkturquoise,
        "lime" : lime,
        "springgreen" : springgreen,
        "aqua" : aqua,
        "cyan" : cyan,
        "midnightblue" : midnightblue,
        "dodgerblue" : dodgerblue,
        "lightseagreen" : lightseagreen,
        "forestgreen" : forestgreen,
        "seagreen" : seagreen,
        "darkslategray" : darkslategray,
        "darkslategrey" : darkslategrey,
        "limegreen" : limegreen,
        "mediumseagreen" : mediumseagreen,
        "turquoise" : turquoise,
        "royalblue" : royalblue,
        "steelblue" : steelblue,
        "darkslateblue" : darkslateblue,
        "mediumturquoise" : mediumturquoise,
        "indigo" : indigo,
        "darkolivegreen" : darkolivegreen,
        "cadetblue" : cadetblue,
        "cornflowerblue" : cornflowerblue,
        "rebeccapurple" : rebeccapurple,
        "mediumaquamarine" : mediumaquamarine,
        "dimgray" : dimgray,
        "dimgrey" : dimgrey,
        "slateblue" : slateblue,
        "olivedrab" : olivedrab,
        "slategray" : slategray,
        "slategrey" : slategrey,
        "lightslategray" : lightslategray,
        "lightslategrey" : lightslategrey,
        "mediumslateblue" : mediumslateblue,
        "lawngreen" : lawngreen,
        "chartreuse" : chartreuse,
        "aquamarine" : aquamarine,
        "maroon" : maroon,
        "purple" : purple,
        "olive" : olive,
        "gray" : gray,
        "grey" : grey,
        "skyblue" : skyblue,
        "lightskyblue" :lightskyblue,
        "blueviolet" : blueviolet,
        "darkred" : darkred,
        "darkmagenta" : darkmagenta,
        "saddlebrown" : saddlebrown,
        "darkseagreen" : darkseagreen,
        "lightgreen" : lightgreen,
        "mediumpurple" : mediumpurple,
        "darkviolet" : darkviolet,
        "palegreen" : palegreen,
        "darkorchid" : darkorchid,
        "yellowgreen" : yellowgreen,
        "sienna" : sienna,
        "brown" : brown,
        "darkgray" : darkgray,
        "darkgrey" : darkgrey,
        "lightblue" : lightblue,
        "greenyellow" : greenyellow,
        "paleturquoise" : paleturquoise,
        "lightsteelblue" : lightsteelblue,
        "powderblue" : powderblue,
        "firebrick" : firebrick,
        "darkgoldenrod" : darkgoldenrod,
        "mediumorchid" : mediumorchid,
        "rosybrown" : rosybrown,
        "darkkhaki" : darkkhaki,
        "silver" : silver,
        "mediumvioletred" : mediumvioletred,
        "indianred" : indianred,
        "peru" : peru,
        "chocolate" : chocolate,
        "tan " : tan,
        "lightgray" : lightgray,
        "lightgrey" : lightgrey,
        "thistle" : thistle,
        "orchid" : orchid,
        "goldenrod" : goldenrod,
        "palevioletred" : palevioletred,
        "crimson" : crimson,
        "gainsboro" : gainsboro,
        "plum" : plum,
        "burlywood" : burlywood,
        "lightcyan" : lightcyan,
        "lavender" : lavender,
        "darksalmon" : darksalmon,
        "violet" : violet,
        "palegoldenrod" : palegoldenrod,
        "lightcoral" : lightcoral,
        "khaki" : khaki,
        "aliceblue" : aliceblue,
        "honeydew" : honeydew,
        "azure" : azure,
        "sandybrown" : sandybrown,
        "wheat" : wheat,
        "beige" : beige,
        "whitesmoke" : whitesmoke,
        "mintcream" : mintcream,
        "ghostwhite" : ghostwhite,
        "salmon" : salmon,
        "antiquewhite" : antiquewhite,
        "linen" : linen,
        "lightgoldenrodyellow" : lightgoldenrodyellow,
        "oldlace" : oldlace,
        "red " : red,
        "fuchsia" : fuchsia,
        "magenta" : magenta,
        "deeppink" : deeppink,
        "orangered" : orangered,
        "tomato" : tomato,
        "hotpink" : hotpink,
        "coral" : coral,
        "darkorange" : darkorange,
        "lightsalmon" : lightsalmon,
        "orange" : orange,
        "lightpink" : lightpink,
        "pink" : pink,
        "gold" : gold,
        "peachpuff" : peachpuff,
        "navajowhite" : navajowhite,
        "moccasin" : moccasin,
        "bisque" : bisque,
        "mistyrose" : mistyrose,
        "blanchedalmond" : blanchedalmond,
        "papayawhip" : papayawhip,
        "lavenderblush" : lavenderblush,
        "seashell" : seashell,
        "cornsilk" : cornsilk,
        "lemonchiffon" : lemonchiffon,
        "floralwhite" : floralwhite,
        "snow" : snow,
        "yellow" : yellow,
        "lightyellow" : lightyellow,
        "ivory" : ivory,
        "white" : white,
    ]
    //@objc public static var black             = Color(hex6: 0x000000)
    @objc public static var navy              = Color(hex6: 0x000080)
    @objc public static var darkblue          = Color(hex6: 0x00008b)
    @objc public static var mediumblue        = Color(hex6: 0x0000cd)
    //@objc public static var blue              = Color(hex6: 0x0000ff)
    @objc public static var darkgreen         = Color(hex6: 0x006400)
    //@objc public static var green             = Color(hex6: 0x008000)
    @objc public static var teal              = Color(hex6: 0x008080)
    @objc public static var darkcyan          = Color(hex6: 0x008b8b)
    @objc public static var deepskyblue       = Color(hex6: 0x00bfff)
    @objc public static var darkturquoise     = Color(hex6: 0x00ced1)
    @objc public static var mediumspringgreen = Color(hex6: 0x00fa9a)
    @objc public static var lime              = Color(hex6: 0x00ff00)
    @objc public static var springgreen       = Color(hex6: 0x00ff7f)
    @objc public static var aqua              = Color(hex6: 0x00ffff)
    //@objc public static var cyan              = Color(hex6: 0x00ffff)
    @objc public static var midnightblue      = Color(hex6: 0x191970)
    @objc public static var dodgerblue        = Color(hex6: 0x1e90ff)
    @objc public static var lightseagreen     = Color(hex6: 0x20b2aa)
    @objc public static var forestgreen       = Color(hex6: 0x228b22)
    @objc public static var seagreen          = Color(hex6: 0x2e8b57)
    @objc public static var darkslategray     = Color(hex6: 0x2f4f4f)
    @objc public static var darkslategrey     = Color(hex6: 0x2f4f4f)
    @objc public static var limegreen         = Color(hex6: 0x32cd32)
    @objc public static var mediumseagreen    = Color(hex6: 0x3cb371)
    @objc public static var turquoise         = Color(hex6: 0x40e0d0)
    @objc public static var royalblue         = Color(hex6: 0x4169e1)
    @objc public static var steelblue         = Color(hex6: 0x4682b4)
    @objc public static var darkslateblue     = Color(hex6: 0x483d8b)
    @objc public static var mediumturquoise   = Color(hex6: 0x48d1cc)
    @objc public static var indigo            = Color(hex6: 0x4b0082)
    @objc public static var darkolivegreen    = Color(hex6: 0x556b2f)
    @objc public static var cadetblue         = Color(hex6: 0x5f9ea0)
    @objc public static var cornflowerblue    = Color(hex6: 0x6495ed)
    @objc public static var rebeccapurple     = Color(hex6: 0x663399)
    @objc public static var mediumaquamarine  = Color(hex6: 0x66cdaa)
    @objc public static var dimgray           = Color(hex6: 0x696969)
    @objc public static var dimgrey           = Color(hex6: 0x696969)
    @objc public static var slateblue         = Color(hex6: 0x6a5acd)
    @objc public static var olivedrab         = Color(hex6: 0x6b8e23)
    @objc public static var slategray         = Color(hex6: 0x708090)
    @objc public static var slategrey         = Color(hex6: 0x708090)
    @objc public static var lightslategray    = Color(hex6: 0x778899)
    @objc public static var lightslategrey    = Color(hex6: 0x778899)
    @objc public static var mediumslateblue   = Color(hex6: 0x7b68ee)
    @objc public static var lawngreen         = Color(hex6: 0x7cfc00)
    @objc public static var chartreuse        = Color(hex6: 0x7fff00)
    @objc public static var aquamarine        = Color(hex6: 0x7fffd4)
    @objc public static var maroon            = Color(hex6: 0x800000)
    //@objc public static var purple            = Color(hex6: 0x800080)
    @objc public static var olive             = Color(hex6: 0x808000)
    //@objc public static var gray              = Color(hex6: 0x808080)
    @objc public static var grey              = Color(hex6: 0x808080)
    @objc public static var skyblue           = Color(hex6: 0x87ceeb)
    @objc public static var lightskyblue      = Color(hex6: 0x87cefa)
    @objc public static var blueviolet        = Color(hex6: 0x8a2be2)
    @objc public static var darkred           = Color(hex6: 0x8b0000)
    @objc public static var darkmagenta       = Color(hex6: 0x8b008b)
    @objc public static var saddlebrown       = Color(hex6: 0x8b4513)
    @objc public static var darkseagreen      = Color(hex6: 0x8fbc8f)
    @objc public static var lightgreen        = Color(hex6: 0x90ee90)
    @objc public static var mediumpurple      = Color(hex6: 0x9370db)
    @objc public static var darkviolet        = Color(hex6: 0x9400d3)
    @objc public static var palegreen         = Color(hex6: 0x98fb98)
    @objc public static var darkorchid        = Color(hex6: 0x9932cc)
    @objc public static var yellowgreen       = Color(hex6: 0x9acd32)
    @objc public static var sienna            = Color(hex6: 0xa0522d)
    //@objc public static var brown             = Color(hex6: 0xa52a2a)
    @objc public static var darkgray          = Color(hex6: 0xa9a9a9)
    @objc public static var darkgrey          = Color(hex6: 0xa9a9a9)
    @objc public static var lightblue         = Color(hex6: 0xadd8e6)
    @objc public static var greenyellow       = Color(hex6: 0xadff2f)
    @objc public static var paleturquoise     = Color(hex6: 0xafeeee)
    @objc public static var lightsteelblue    = Color(hex6: 0xb0c4de)
    @objc public static var powderblue        = Color(hex6: 0xb0e0e6)
    @objc public static var firebrick         = Color(hex6: 0xb22222)
    @objc public static var darkgoldenrod     = Color(hex6: 0xb8860b)
    @objc public static var mediumorchid      = Color(hex6: 0xba55d3)
    @objc public static var rosybrown         = Color(hex6: 0xbc8f8f)
    @objc public static var darkkhaki         = Color(hex6: 0xbdb76b)
    @objc public static var silver            = Color(hex6: 0xc0c0c0)
    @objc public static var mediumvioletred   = Color(hex6: 0xc71585)
    @objc public static var indianred         = Color(hex6: 0xcd5c5c)
    @objc public static var peru              = Color(hex6: 0xcd853f)
    @objc public static var chocolate         = Color(hex6: 0xd2691e)
    @objc public static var tan               = Color(hex6: 0xd2b48c)
    @objc public static var lightgray         = Color(hex6: 0xd3d3d3)
    @objc public static var lightgrey         = Color(hex6: 0xd3d3d3)
    @objc public static var thistle           = Color(hex6: 0xd8bfd8)
    @objc public static var orchid            = Color(hex6: 0xda70d6)
    @objc public static var goldenrod         = Color(hex6: 0xdaa520)
    @objc public static var palevioletred     = Color(hex6: 0xdb7093)
    @objc public static var crimson           = Color(hex6: 0xdc143c)
    @objc public static var gainsboro         = Color(hex6: 0xdcdcdc)
    @objc public static var plum              = Color(hex6: 0xdda0dd)
    @objc public static var burlywood         = Color(hex6: 0xdeb887)
    @objc public static var lightcyan         = Color(hex6: 0xe0ffff)
    @objc public static var lavender          = Color(hex6: 0xe6e6fa)
    @objc public static var darksalmon        = Color(hex6: 0xe9967a)
    @objc public static var violet            = Color(hex6: 0xee82ee)
    @objc public static var palegoldenrod     = Color(hex6: 0xeee8aa)
    @objc public static var lightcoral        = Color(hex6: 0xf08080)
    @objc public static var khaki             = Color(hex6: 0xf0e68c)
    @objc public static var aliceblue         = Color(hex6: 0xf0f8ff)
    @objc public static var honeydew          = Color(hex6: 0xf0fff0)
    @objc public static var azure             = Color(hex6: 0xf0ffff)
    @objc public static var sandybrown        = Color(hex6: 0xf4a460)
    @objc public static var wheat             = Color(hex6: 0xf5deb3)
    @objc public static var beige             = Color(hex6: 0xf5f5dc)
    @objc public static var whitesmoke        = Color(hex6: 0xf5f5f5)
    @objc public static var mintcream         = Color(hex6: 0xf5fffa)
    @objc public static var ghostwhite        = Color(hex6: 0xf8f8ff)
    @objc public static var salmon            = Color(hex6: 0xfa8072)
    @objc public static var antiquewhite      = Color(hex6: 0xfaebd7)
    @objc public static var linen             = Color(hex6: 0xfaf0e6)
    @objc public static var lightgoldenrodyellow        = Color(hex6: 0xfafad2)
    @objc public static var oldlace           = Color(hex6: 0xfdf5e6)
    //@objc public static var red               = Color(hex6: 0xff0000)
    @objc public static var fuchsia           = Color(hex6: 0xff00ff)
    //@objc public static var magenta           = Color(hex6: 0xff00ff)
    @objc public static var deeppink          = Color(hex6: 0xff1493)
    @objc public static var orangered         = Color(hex6: 0xff4500)
    @objc public static var tomato            = Color(hex6: 0xff6347)
    @objc public static var hotpink           = Color(hex6: 0xff69b4)
    @objc public static var coral             = Color(hex6: 0xff7f50)
    @objc public static var darkorange        = Color(hex6: 0xff8c00)
    @objc public static var lightsalmon       = Color(hex6: 0xffa07a)
    //@objc public static var orange            = Color(hex6: 0xffa500)
    @objc public static var lightpink         = Color(hex6: 0xffb6c1)
    @objc public static var pink              = Color(hex6: 0xffc0cb)
    @objc public static var gold              = Color(hex6: 0xffd700)
    @objc public static var peachpuff         = Color(hex6: 0xffdab9)
    @objc public static var navajowhite       = Color(hex6: 0xffdead)
    @objc public static var moccasin          = Color(hex6: 0xffe4b5)
    @objc public static var bisque            = Color(hex6: 0xffe4c4)
    @objc public static var mistyrose         = Color(hex6: 0xffe4e1)
    @objc public static var blanchedalmond    = Color(hex6: 0xffebcd)
    @objc public static var papayawhip        = Color(hex6: 0xffefd5)
    @objc public static var lavenderblush     = Color(hex6: 0xfff0f5)
    @objc public static var seashell          = Color(hex6: 0xfff5ee)
    @objc public static var cornsilk          = Color(hex6: 0xfff8dc)
    @objc public static var lemonchiffon      = Color(hex6: 0xfffacd)
    @objc public static var floralwhite       = Color(hex6: 0xfffaf0)
    @objc public static var snow              = Color(hex6: 0xfffafa)
    //@objc public static var yellow            = Color(hex6: 0xffff00)
    @objc public static var lightyellow       = Color(hex6: 0xffffe0)
    @objc public static var ivory             = Color(hex6: 0xfffff0)
    //@objc public static var white             = Color(hex6: 0xffffff)
    /// init color with hex like red, #ABCDEF
    public class func css(_ name: String) -> Color? {
        return self.cssMap[name] ?? Color.hex(name)
    }
}

#endif
