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
    
    [DEMO testGCDQOS];
    
    [DEMO testNSOperationTryCatch];
    
    
    [UIViewController hookWithCls:[UIViewController class] originalSelector:@selector(viewWillAppear:) option:nil block:^{
        NSLog(@"ssssss");
    }];
    
    
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
    
    
    UIViewController *vc = [[UIViewController alloc] init];
    [self presentViewController:vc animated:YES completion:^{
    }];
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





