//
//  AppDelegate.m
//  VivilyVedioPlayer
//
//  Created by yangxianggang on 17/3/11.
//  Copyright © 2017年 yangxianggang. All rights reserved.
//

#import "AppDelegate.h"
#import "DataManager.h"
#import "RootTabBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //获取所有数据
     self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    NSString * url = @"http://c.m.163.com/nc/video/home/0-10.html";
    [[DataManager shareManager] getAllDataWithURL:url successBlock:^(NSArray *vedioArray, NSArray *sidArray) {
        self.sidArray = [NSArray arrayWithArray:sidArray];
        self.vedioArray = [NSArray arrayWithArray:vedioArray];
        
    } failBlock:^(NSError *error) {
        
        NSLog(@"error:%@",error);
    }];
    self.window.rootViewController = self.tabBarViewController = [[RootTabBarViewController alloc] init];
    [self.window makeKeyWindow];
    
    
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
+ (AppDelegate *)shareAppDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
    
}

@end
