//
//  PHViewController.m
//  New_Simplify
//
//  Created by Kowloon on 15/9/29.
//  Copyright © 2015年 Goome. All rights reserved.
//

#import "PHViewController.h"
#ifdef kMobClick
#import "MobClick.h"
#endif
@interface PHViewController ()

@end

@implementation PHViewController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    MNLog(@"%@ --> dealloc", NSStringFromClass([self class]));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.appearRefresh = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(viewControllerDidEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(viewControllerDidBecomeActive) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(viewControllerWillResignActive) name:UIApplicationWillResignActiveNotification object:nil];
    [self.navigationItem setHidesBackButton:YES];
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"home_backArrow"] style:UIBarButtonItemStyleDone target:self action:@selector(backClick)];
    self.navigationItem.leftBarButtonItem = left;
    _leftBarItem = left;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}
- (void)backClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.appearRefresh = YES;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
#ifdef kMobClick
    [MobClick beginLogPageView:[NSString stringWithFormat:@"%@",NSStringFromClass([self class])]];
#endif
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
#ifdef kMobClick
    [MobClick endLogPageView:[NSString stringWithFormat:@"%@",NSStringFromClass([self class])]];
#endif
}

- (void)viewControllerDidEnterBackground{
    MNLog(@"%@ -> %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

- (void)viewControllerDidBecomeActive{
    MNLog(@"%@ -> %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}
- (void)viewControllerWillResignActive{
    MNLog(@"%@ -> %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}
@end


