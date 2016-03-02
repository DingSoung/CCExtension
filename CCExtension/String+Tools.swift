//
//  String+Tools.swift
//
//
//  Created by Ding Soung on 15/5/26.
//
//

import Foundation
import UIKit

extension String {
    
    ///约束宽度 字号, 计算高度
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.max)
        
        let boundingBox = self.boundingRectWithSize(constraintRect, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox.height
    }
    
	//MARK: 转浮点数
	public var floatValue: Float {
		return (self as NSString).floatValue
	}
	
	//MARK: MD5 加密  import <CommonCrypto/CommonCrypto.h>
	public var md5: String! {
		let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
		let strLen = CC_LONG(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
		let digestLen = Int(CC_MD5_DIGEST_LENGTH)
		let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
		CC_MD5(str!, strLen, result)
		let hash = NSMutableString()
		for i in 0..<digestLen {
			hash.appendFormat("%02x", result[i])
		}
		result.dealloc(digestLen)
		return hash as String
	}
    
	//MARK: 由NSString扩展而来
	public var hexString: String {
		return (self as NSString).dataUsingEncoding(NSUTF8StringEncoding)!.hexString
	}
	public var MD5: String {
		return (self as NSString).dataUsingEncoding(NSUTF8StringEncoding)!.MD5.hexString
	}
	public var SHA1: String {
		return (self as NSString).dataUsingEncoding(NSUTF8StringEncoding)!.SHA1.hexString
	}
	
	//MARK: 是否为手机号
	public var isMobileNumber: Bool {
		//前缀0 86 17951 或者没有  中间13* 15* 17* 145 147 后加8个0～9的数
		let format = NSPredicate(format: "SELF MATCHES %@", "^(0|86|086|17951)?1(3[0-9]|4[57]|7[0-9]|8[0123456789])[0-9]{8}$")
		return format.evaluateWithObject(self)
	}
	
	//MARK: 是否为一代或二代身份证号
	public var isIDCard: Bool {
		let format1 = NSPredicate(format: "SELF MATCHES %@", "^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$")
		let format2 = NSPredicate(format: "SELF MATCHES %@", "^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2))(([0|1|2]\\d)|2[0-1])\\d{4}$")
		return format1.evaluateWithObject(self) || format2.evaluateWithObject(self)
	}
	
	/*
	提取信息中的网络链接:(h|H)(r|R)(e|E)(f|F) *= *('|")?(\w|\\|\/|\.)+('|"| *|>)?
	提取信息中的邮件地址:\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*
	提取信息中的图片链接:(s|S)(r|R)(c|C) *= *('|")?(\w|\\|\/|\.)+('|"| *|>)?
	提取信息中的IP地址:(\d+)\.(\d+)\.(\d+)\.(\d+)
	提取信息中的中国手机号码:(86)*0*13\d{9}
	提取信息中的中国固定电话号码:(\(\d{3,4}\)|\d{3,4}-|\s)?\d{8}
	提取信息中的中国电话号码（包括移动和固定电话）:(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}
	提取信息中的中国邮政编码:[1-9]{1}(\d+){5}
	提取信息中的中国身份证号码:\d{18}|\d{15}
	提取信息中的整数：\d+
	提取信息中的浮点数（即小数）：(-?\d*)\.?\d+
	提取信息中的任何数字 ：(-?\d*)(\.\d+)?
	提取信息中的中文字符串：[\u4e00-\u9fa5]*
	提取信息中的双字节字符串 (汉字)：[^\x00-\xff]*
	*/
	
}

extension NSAttributedString {
    
    ///约束宽度 字号, 计算高度
    func heightWithConstrainedWidth(width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.max)
        let boundingBox = self.boundingRectWithSize(constraintRect, options: NSStringDrawingOptions.UsesLineFragmentOrigin, context: nil)
        
        return ceil(boundingBox.height)
    }
    
    ///约束高度 字号, 计算宽度
    func widthWithConstrainedHeight(height: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: CGFloat.max, height: height)
        
        let boundingBox = self.boundingRectWithSize(constraintRect, options: NSStringDrawingOptions.UsesLineFragmentOrigin, context: nil)
        
        return ceil(boundingBox.width)
    }
}
