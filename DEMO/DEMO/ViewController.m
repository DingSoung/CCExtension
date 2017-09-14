//
//  ViewController.m
//  DEMO
//
//  Created by Songwen Ding on 8/8/16.
//  Copyright © 2016 DingSong. All rights reserved.
//

#import "ViewController.h"
#import <CCKit/CCKit-Swift.h>

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
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    [self.view addSubview:imageView];
    
    __weak typeof(imageView) weakImageView = imageView;
    [[CCPDFImage instance] asyncGetImage:@"Group" bundle:[NSBundle mainBundle] page:1 size:imageView.bounds.size mainQueueBlock:^(UIImage * _Nullable image) {
        weakImageView.image = image;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
