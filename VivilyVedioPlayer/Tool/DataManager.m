
//
//  DataManager.m
//  VivilyVedioPlayer
//
//  Created by yangxianggang on 17/3/11.
//  Copyright © 2017年 yangxianggang. All rights reserved.
//

#import "DataManager.h"
#import "VedioModel.h"
#import "SidModel.h"

@implementation DataManager

+ (instancetype)shareManager
{
    static DataManager * manager = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        if (manager == nil) {
                manager = [[[self class] alloc] init];
        }
    });
    return manager;
}
- (void)getAllDataWithURL:(NSString *)url successBlock:(void(^)(NSArray * vedioArray,NSArray *sidArray))successBlock failBlock:(void(^)(NSError *error))failBlock
{
    NSMutableArray * vedioArray = [NSMutableArray array];
    NSMutableArray * sideArray = [NSMutableArray array];
    
    dispatch_queue_t globle = dispatch_get_global_queue(0, 0);
   // dispatch_async(globle, ^{
        NSURL *URL = [NSURL URLWithString:url];
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask * dataTask = [session dataTaskWithURL:URL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error) {
                failBlock(error);
            }else{
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                NSLog(@"json:%@",json);
                for (NSDictionary *videoDic in [json objectForKey:@"videoList"]) {
                    VedioModel * model = [[VedioModel alloc] init];
                    [model setValuesForKeysWithDictionary:videoDic];
                    [vedioArray addObject:model];
               
                }
                for (NSDictionary *sideDic in [json objectForKey:@"videoSidList"]) {
                    SidModel * sidemodel = [[SidModel alloc] init];
                    [sidemodel setValuesForKeysWithDictionary:sideDic];
                    [sideArray addObject:sidemodel];
                }
                
                if (successBlock) {
                    successBlock(vedioArray,sideArray);
                }
          
            }
            
        }];
        [dataTask resume];
  //  });
  
    
    
}




@end
