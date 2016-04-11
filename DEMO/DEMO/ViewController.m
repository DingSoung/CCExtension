//
//  ViewController.m
//  DEMO
//
//  Created by Alex D. on 4/8/16.
//  Copyright © 2016 ifnil. All rights reserved.
//

#import "ViewController.h"
#import <CCKit/CCKit-swift.h>

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [[UIColor alloc] initWithHex:0xFFAA77];
    
    [CCNetwork GET:@"http://www.v2ex.com/api/nodes/all.json" parameter:@{} success:^(NSData *data) {
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
