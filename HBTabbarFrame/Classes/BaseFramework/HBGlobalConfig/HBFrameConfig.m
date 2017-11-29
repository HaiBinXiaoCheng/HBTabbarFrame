//
//  HBFrameConfig.m
//  HBTabbarFrame
//
//  Created by mass on 2017/11/29.
//  Copyright © 2017年 HB. All rights reserved.
//

#import "HBFrameConfig.h"

static HBFrameConfig *shareInstance = nil;

@implementation HBFrameConfig

+ (HBFrameConfig *)shareInstance {
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        shareInstance = [[HBFrameConfig alloc] init];
    });
    return shareInstance;
}

/**
 APP开始加载,对应APPDelegate的第一个

 @param launchOptions 信息
 */
- (void)applicationDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
}

@end
