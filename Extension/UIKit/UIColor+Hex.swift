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

extension UIColor {
    
    //@nonobjc private static let cache = NSCache()
    private struct AssociatedKeys{
        static var cache = "cache"
    }
    
    public class var cache: NSCache<NSString, AnyObject>? {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.cache, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let cache = objc_getAssociatedObject(self, &AssociatedKeys.cache) as? NSCache<NSString, AnyObject> {
                return cache
            } else {
                self.cache = NSCache()
                return self.cache
            }
        }
    }
    
    /// convert UIColor to hex string
    public var hexString:String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
    
    internal class final func colorComponent(hex:String, start:Int, lenght:Int) -> CGFloat {
        let subString = (hex as NSString).substring(with: NSMakeRange(start, lenght))
        let fulHex = lenght == 2 ? subString : subString + subString
        var hexComponent:UInt32 = 0
        Scanner(string: fulHex).scanHexInt32(&hexComponent)
        return CGFloat(hexComponent) / 255.0
    }
    
    /// convert hex to UIColor #RGB, #ARGB, #RRGGBB, #AARRGGBB
    public class final func color(hex:String) -> UIColor? {
        if let color = self.cache?.object(forKey: hex as NSString) as? UIColor {
            return color
        }
        let formatHex = (hex as NSString).replacingOccurrences(of: "#", with: "").uppercased()
        var alpha:CGFloat = 0
        var red:CGFloat = 0
        var blue:CGFloat = 0
        var green:CGFloat = 0
        switch formatHex.characters.count {
        case 3: //#RGB
            alpha = 1
            red = self.colorComponent(hex: formatHex, start: 0, lenght: 1)
            green = self.colorComponent(hex: formatHex, start: 1, lenght: 1)
            blue = self.colorComponent(hex: formatHex, start: 2, lenght: 1)
        case 4: //#ARGB
            alpha = self.colorComponent(hex: formatHex, start: 0, lenght: 1)
            red = self.colorComponent(hex: formatHex, start: 1, lenght: 1)
            green = self.colorComponent(hex: formatHex, start: 2, lenght: 1)
            blue = self.colorComponent(hex: formatHex, start: 3, lenght: 1)
        case 6: //#RRGGBB
            alpha = 1
            red = self.colorComponent(hex: formatHex, start: 0, lenght: 2)
            green = self.colorComponent(hex: formatHex, start: 2, lenght: 2)
            blue = self.colorComponent(hex: formatHex, start: 4, lenght: 2)
        case 8: //#AARRGGBB
            alpha = self.colorComponent(hex: formatHex, start: 0, lenght: 2)
            red = self.colorComponent(hex: formatHex, start: 2, lenght: 2)
            green = self.colorComponent(hex: formatHex, start: 4, lenght: 2)
            blue = self.colorComponent(hex: formatHex, start: 6, lenght: 2)
        default:
            return nil
        }
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
        self.cache?.setObject(color, forKey: hex as NSString)
        return color
    }
}

