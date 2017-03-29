//
//  ViewController.m
//  DEMO
//
//  Created by Songwen Ding on 2017/1/23.
//  Copyright © 2017年 DingSoung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) NSString *validTitle;
@property (nonatomic, copy) NSString *hello;
@end

@implementation ViewController

- (void)testsgsgsg:(NSString *)str {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"%@---------      ----------", str);
    });
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[LOGSS alloc] test];
    
    [DEMO testGCDQOS];
    
    [DEMO testNSOperationTryCatch];
    
    [self testsgsgsg:@"111111111111"];
    [self testsgsgsg:@"222222222222"];
    
    self.hello = @"hell0--------";
     __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"%@",weakSelf.hello);
    });
    NSLog(@"%@",self.hello);
    self.hello = @"hell1;;;;;;;;;;";
    
    
    [UIViewController hookWithCls:[UIViewController class] originalSelector:@selector(viewWillAppear:) option:nil block:^{
        NSLog(@"ssssss");
    }];
    
    NSString *string = @"English 中文 國語 日本語の 😀";
    [string widthWithConstrainedHeight:100 font:[UIFont systemFontOfSize:16]];
    const char *cString = [string UTF8String];
    NSLog(@"%d", (int)strlen(cString));
    
    void (^tryExcuseWithQueue)(NSOperationQueue*, void(^)(), void(^)(), void(^)()) = ^(NSOperationQueue* queue, void(^tryBlock)(), void(^catchBlock)(NSException *), void(^finishedBlock)()) {
        [queue addOperationWithBlock:^{
            @try {
                if (tryBlock) {
                    tryBlock();
                }
            } @catch (NSException *exception) {
                if (catchBlock) {
                    catchBlock(exception);
                } else {
                    NSLog(@"class:%@\n exception:%@\n model:%@",@"DataService", exception.reason, nil);
                }
            } @finally {
                if (finishedBlock) {
                    finishedBlock();
                }
            }
        }];
    };
    
    
    tryExcuseWithQueue([[NSOperationQueue alloc] init], ^{
        NSString *str = nil;
        NSArray<NSString *> *strs = @[str];
        NSLog(@"%lu",strs.count);
    }, nil, nil);
    
    tryExcuseWithQueue([[NSOperationQueue alloc] init], ^{
        NSString *str = nil;
        NSArray<NSString *> *strs = @[str];
        NSLog(@"%lu",strs.count);
    }, ^(NSException *exception){
        NSLog(@"xxxxxxx %@",exception);
    }, nil);
    
    
    tryExcuseWithQueue([[NSOperationQueue alloc] init], ^{
        NSString *str = nil;
        NSArray<NSString *> *strs = @[str];
        NSLog(@"%lu",strs.count);
    }, ^(NSException *exception){
        NSLog(@"xxxxxxx %@",exception);
    }, ^{
        NSLog(@"xxxxxxxxxxxxxxx xxxxxxxxxxxx");
    });
    
    
    
    
    
    @try {
        NSString *str = nil;
        NSArray<NSString *> *strs = @[str];
        NSLog(@"%lu",strs.count);
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
    } @finally {
    }
    
    @try {
        [[[NSOperationQueue alloc] init] addOperationWithBlock:^{
            @try {
                NSString *str = nil;
                NSArray<NSString *> *strs = @[str];
                NSLog(@"%lu",strs.count);
            } @catch (NSException *exception) {
                NSLog(@"%@", exception.reason);
                
            } @finally {
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
    } @finally {
    }
    
    
    //[DEMO testNSOperationQOS];
    
    //[DEMO testSwiftTools];
    
    //[[DEMO new] testSwizzle];
    
    // Cache
    for (int i = 0; i < 100; i++) {
        self.index = i;
        self.validTitle = [NSString stringWithFormat:@"%d",i];
        
        ViewController *vc = nil;
        if ([NSObject removeCacheWithKey:@"self" atPath:@"__SELF__"]) {
        } else {
            NSLog(@"--------------->erase fail");
        }
        [[NSObject memoryCache] removeAllObjects];
        vc = [NSObject cacheWithKey:@"self" atPath:@"__SELF__"];
        if (vc) {
            NSLog(@"--------------->blank check fail");
        }
        
        if ([NSObject setCacheWithObject:self forKey:@"self" atPath:@"__SELF__"]) {
        } else {
            NSLog(@"--------------->program fail");
        }
        [[NSObject memoryCache] removeAllObjects];
        vc = [NSObject cacheWithKey:@"self" atPath:@"__SELF__"];
        if (self.index != vc.index || ![self.validTitle isEqualToString:vc.validTitle]) {
            NSLog(@"--------------->verify fail:");
        }
    }
    
    // Do any additional setup after loading the view, typically from a nib.
    [UIImage imageNamed:@"image"].roundImage;
    
    [UIApplication switchHook];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [super encodeWithCoder:aCoder];
    
    [aCoder encodeInteger:self.index     forKey:@"index"];
    [aCoder encodeObject:self.validTitle     forKey:@"validTitle"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        self.index = [aDecoder decodeIntegerForKey:@"index"];
        self.validTitle = [aDecoder decodeObjectForKey:@"validTitle"];
    }
    return self;
}

@end
