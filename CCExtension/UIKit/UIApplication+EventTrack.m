//
//  UIApplication+EventTrack.m
//  DEMO
//
//  Created by Songwen Ding on 10/31/16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "UIApplication+EventTrack.h"
#include <objc/runtime.h>

@implementation UIApplication(EventTrack)

+ (void)loadaaa {
    Class class = [self class];
    SEL originalSelector = @selector(sendAction:to:from:forEvent:);
    SEL replacementSelector = @selector(heap_sendAction:to:from:forEvent:);
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method replacementMethod = class_getInstanceMethod(class, replacementSelector);
    method_exchangeImplementations(originalMethod, replacementMethod);
}

- (BOOL)heap_sendAction:(SEL)action to:(id)target from:(id)sender forEvent:(UIEvent *)event {
    NSString *selectorName = NSStringFromSelector(action);
    printf("Selector %s occurred.\n", [selectorName UTF8String]);
    return [self sendAction:action to:target from:sender forEvent:event];
}

@end
