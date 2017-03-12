//
//  DataManager.h
//  VivilyVedioPlayer
//
//  Created by yangxianggang on 17/3/11.
//  Copyright © 2017年 yangxianggang. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^allSuccessBlock)(NSArray *sideArray,NSArray *vedioArray);
typedef void (^allFailuerBlock)(id object);


@interface DataManager : NSObject
+ (instancetype)shareManager;
- (void)getAllDataWithURL:(NSString *)url successBlock:(void(^)(NSArray * vedioArray,NSArray *sidArray))successBlock failBlock:(void(^)(NSError *error))failBlock;
@end
