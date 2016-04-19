//
//  ViewController.m
//  DEMO
//
//  Created by Songwen Ding on 3/7/16.
//  Copyright © 2016 ifnil All rights reserved.
//

#import "ViewController.h"
#import "DEMO-Swift.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *models;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imageView.image = [UIImage imageNamed:@"image"].roundImage;
    self.tableView = [[UITableView alloc] init];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    
    [self.tableView cc_refreashInit];
    self.tableView.cc_refreshClosure = ^ {
        NSLog(@"table view freash");
    };
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.models = @[@"1", @"3", @"5", @"7", @"9",];
    [self.view addSubview:self.tableView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.tableView.frame = CGRectMake(0, 50, self.view.bounds.size.width, 300);
    [self.tableView.cc_refreshControl beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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




@end





