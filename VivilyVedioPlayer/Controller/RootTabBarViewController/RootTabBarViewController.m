//
//  RootTabBarViewController.m
//  VivilyVedioPlayer
//
//  Created by yangxianggang on 17/3/11.
//  Copyright © 2017年 yangxianggang. All rights reserved.
//

#import "RootTabBarViewController.h"
#import "TencentViewController.h"
#import "SinaViewController.h"
#import "NavViewController.h"
@interface RootTabBarViewController ()

@end

@implementation RootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TencentViewController *tencentContrller = [[TencentViewController alloc] init];
    tencentContrller.title = @"腾讯";
    
    NavViewController * baseNav = [[NavViewController alloc] initWithRootViewController:tencentContrller];
    tencentContrller.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"腾讯" image:[UIImage imageNamed:@"found"] selectedImage:[UIImage imageNamed:@"found_s"]];
    baseNav.navigationBar.barTintColor = [UIColor redColor];
    
    
    SinaViewController * sinaCon = [[SinaViewController alloc] init];
    sinaCon.title = @"新浪";
    NavViewController *sinaNav = [[NavViewController alloc] initWithRootViewController:sinaCon];
    sinaNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"新浪" image:[UIImage imageNamed:@"message"] selectedImage:[UIImage imageNamed:@"message_s"]];
      sinaNav.navigationBar.barTintColor = [UIColor redColor];
    self.tabBar.tintColor = [UIColor redColor];
    self.viewControllers = @[baseNav,sinaNav];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
