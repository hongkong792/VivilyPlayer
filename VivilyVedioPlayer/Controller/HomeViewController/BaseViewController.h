//
//  BaseViewController.h
//  VivilyVedioPlayer
//
//  Created by yangxianggang on 17/3/11.
//  Copyright © 2017年 yangxianggang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface BaseViewController : UIViewController

/**
 *用了自定义的手势，则系统的手势被关闭
 */
@property (nonatomic,assign)BOOL isPanGestureEnable;
@property (nonatomic,retain)MBProgressHUD *hud;
- (void)addHudView;
- (void)addHudViewWithMessage:(NSString *)message;
- (void)removeHudView;


@end
