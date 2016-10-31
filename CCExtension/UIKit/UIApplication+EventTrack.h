//
//  UIApplication+EventTrack.h
//  DEMO
//
//  Created by Songwen Ding on 10/31/16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication(EventTrack)

+ (void)loadaaa;

- (BOOL)heap_sendAction:(SEL)action to:(id)target from:(id)sender forEvent:(UIEvent *)event;
@end
