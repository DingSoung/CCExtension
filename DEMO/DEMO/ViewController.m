//
//  ViewController.m
//  DEMO
//
//  Created by Alex D. on 4/8/16.
//  Copyright © 2016 ifnil. All rights reserved.
//

#import "ViewController.h"
#import <CCKit/CCKit.h>
#import <CCKit/CCKit-Swift.h>

@interface ViewController ()
@property (nonatomic, copy) CCModel *model;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *color = [[UIColor alloc] init];
    
    [CCNetwork GET:@"https://baidu.com" parameter:@{} success:^(NSData *data) {
        NSLog(@"%@", data.jsonObject);
    } fail:^(NSError *error) {
        NSLog(@"%@", error.domain);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
