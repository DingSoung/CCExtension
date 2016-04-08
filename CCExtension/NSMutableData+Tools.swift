//
//  NSMutableData+Tools.swift
//  GiftBox
//
//  Created by Cuicui2 on 15/6/6.
//  Copyright (c) 2015年 ifnil All rights reserved.
//

import Foundation
extension NSMutableData {
	
	///Convenient way to append bytes
	public func appendBytes(arrayOfBytes: [UInt8]) {
		self.appendBytes(arrayOfBytes, length: arrayOfBytes.count)
	}
}