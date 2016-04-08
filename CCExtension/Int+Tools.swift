//
//  Int+Tools.swift
//  GiftBox
//
//  Created by Songwen Ding on 15/6/6.
//  Copyright (c) 2015年 ifnil All rights reserved.
//

extension Int {
    public var hexString: String {
		return String(format:"%02x", self)
	}
}