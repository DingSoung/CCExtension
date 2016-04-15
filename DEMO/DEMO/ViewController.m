//
//  ViewController.m
//  DEMO
//
//  Created by Songwen Ding on 3/7/16.
//  Copyright © 2016 ifnil All rights reserved.
//

#import "ViewController.h"
#import "DEMO-Swift.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imageView.image = [UIImage imageNamed:@"image"].roundImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
