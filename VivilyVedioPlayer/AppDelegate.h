//
//  AppDelegate.h
//  VivilyVedioPlayer
//
//  Created by yangxianggang on 17/3/11.
//  Copyright © 2017年 yangxianggang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, copy)NSArray *sidArray;
@property (nonatomic, copy)NSArray *vedioArray;
@property (nonatomic,strong)UITabBarController *tabBarViewController;
+ (AppDelegate *)shareAppDelegate;
@end

