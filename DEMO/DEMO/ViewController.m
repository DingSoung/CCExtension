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
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    [self.view addSubview:imageView];
    __weak typeof(imageView) weakImageView = imageView;
    [imageView setImageVithPDF:@"Group" size:imageView.bounds.size pageIndex:1 success:^(UIImage *image) {
        weakImageView.image = image.roundImage;
    } fail:^(NSError * error) {
        NSLog(@"%@",error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
