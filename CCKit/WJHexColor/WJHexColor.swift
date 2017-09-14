//
//  WJHexColor.swift
//  DEMO
//
//  Created by Songwen Ding on 7/1/16.
//  Copyright © 2016 Songwen Ding. All rights reserved.
//

import UIKit

public extension UIColor {
    
    @nonobjc private static let cache = NSCache()
    
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
    
    internal class final func colorComponentWithHex(hex:String, start:Int, lenght:Int) -> CGFloat {
        let subString = hex.substringWithRange(Range<String.Index>(hex.startIndex.advancedBy(start)..<hex.startIndex.advancedBy(start + lenght)))
        let fulHex = lenght == 2 ? subString : subString + subString
        var hexComponent:UInt32 = 0
        NSScanner(string: fulHex).scanHexInt(&hexComponent)
        return CGFloat(hexComponent) / 255.0
    }
    
    /// convert hex to UIColor #RGB, #ARGB, #RRGGBB, #AARRGGBB
    public class final func colorWithHex(hex:String) -> UIColor? {
        if let color = self.cache.objectForKey(hex) as? UIColor {
            return color
        }
        
        let formatHex = hex.stringByReplacingOccurrencesOfString("#", withString: "").uppercaseString
        var alpha:CGFloat = 0
        var red:CGFloat = 0
        var blue:CGFloat = 0
        var green:CGFloat = 0
        switch formatHex.characters.count {
        case 3: //#RGB
            alpha = 1
            red = self.colorComponentWithHex(formatHex, start: 0, lenght: 1)
            green = self.colorComponentWithHex(formatHex, start: 1, lenght: 1)
            blue = self.colorComponentWithHex(formatHex, start: 2, lenght: 1)
        case 4: //#ARGB
            alpha = self.colorComponentWithHex(formatHex, start: 0, lenght: 1)
            red = self.colorComponentWithHex(formatHex, start: 1, lenght: 1)
            green = self.colorComponentWithHex(formatHex, start: 2, lenght: 1)
            blue = self.colorComponentWithHex(formatHex, start: 3, lenght: 1)
        case 6: //#RRGGBB
            alpha = 1
            red = self.colorComponentWithHex(formatHex, start: 0, lenght: 2)
            green = self.colorComponentWithHex(formatHex, start: 2, lenght: 2)
            blue = self.colorComponentWithHex(formatHex, start: 4, lenght: 2)
        case 8: //#AARRGGBB
            alpha = self.colorComponentWithHex(formatHex, start: 0, lenght: 2)
            red = self.colorComponentWithHex(formatHex, start: 2, lenght: 2)
            green = self.colorComponentWithHex(formatHex, start: 4, lenght: 2)
            blue = self.colorComponentWithHex(formatHex, start: 6, lenght: 2)
        default:
            return nil
        }
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
        self.cache.setObject(color, forKey: hex)
        return color
    }
}


