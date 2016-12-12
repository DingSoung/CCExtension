//
//  ViewController.m
//  DEMO
//
//  Created by Songwen Ding on 3/7/16.
//  Copyright © 2016 DingSoung. All rights reserved.
//

#import "ViewController.h"
#import "DEMO-Swift.h"

@interface ViewController () <NSCoding, UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *models;

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) NSString *validTitle;
@end

@implementation ViewController
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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [DEMO testSwiftTools];
    
    [[DEMO new] testSwizzle];
    
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
    self.imageView.image = [UIImage imageNamed:@"image"].roundImage;
    self.tableView = [[UITableView alloc] init];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.models = @[@"1", @"3", @"5", @"7", @"9",];
    [self.view addSubview:self.tableView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.tableView.frame = CGRectMake(0, 300, self.view.bounds.size.width, 100);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)buttonAction:(UIButton *)sender {
    NSLog(@"button touched");
    
    [UIApplication switchHook];
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.models.count > 0 ? 1 : 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    cell.textLabel.text = self.models[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"table selected");
}


@end





