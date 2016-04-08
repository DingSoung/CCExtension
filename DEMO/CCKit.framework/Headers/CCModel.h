//
//  CCModel.h
//
//  Created by Alex D. on 11/23/15.
//  Copyright © 2015 ifnil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCModel : NSObject

- (instancetype)init;
- (instancetype)initWithJsonStr: (NSString *)JsonStr ;
- (instancetype)initWithDict: (NSDictionary *)JsonDict;

@end
