//
//  VedioModel.m
//  VivilyVedioPlayer
//
//  Created by yangxianggang on 17/3/12.
//  Copyright © 2017年 yangxianggang. All rights reserved.
//

#import "VedioModel.h"

@implementation VedioModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"description"]) {
        self.descriptionDe = value;
    }
}
@end
