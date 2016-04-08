//
//  UIImageView+Tools.swift
//  
//
//  Created by Songwen Ding on 15/5/26.
//
//

import UIKit
extension UIImageView {
    
	///按比例或缩放Image
	class func imageScale(image: UIImage!, ratio: CGFloat) -> UIImage {
		UIGraphicsBeginImageContext(CGSizeMake(image.size.width * ratio,image.size.height * ratio));
		image.drawInRect(CGRectMake(0, 0, image.size.width * ratio, image.size.height * ratio))
		let scaledImage = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		return scaledImage
	}
    ///按指定尺寸缩放Image
	class func imageScale(image: UIImage!, size: CGSize) -> UIImage {
		UIGraphicsBeginImageContext( size  );
		image.drawInRect(CGRectMake(0, 0, size.width, size.height))
		let scaledImage = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		return scaledImage
	}
	
	///设置调整大小后的image
	public func setImageScaled(imageNamed: String!, ratio: CGFloat) {
		self.image = UIImageView.imageScale(UIImage(named: imageNamed), ratio: ratio)
	}
	public func setImageScaled(imageNamed: String!, size: CGSize) {
		self.image = UIImageView.imageScale(UIImage(named: imageNamed), size: size)
	}
}
