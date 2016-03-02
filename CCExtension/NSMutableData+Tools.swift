//
//  NSMutableData+Tools.swift
//  GiftBox
//
//  Created by Ding Soung on 15/6/6.
//  Copyright (c) 2015年 xinyihezi. All rights reserved.
//

import Foundation
extension NSMutableData {
	
	//MARK: Convenient way to append bytes
	public func appendBytes(arrayOfBytes: [UInt8]) {
		self.appendBytes(arrayOfBytes, length: arrayOfBytes.count)
	}
}