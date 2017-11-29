//
//  HBFrameConfig.h
//  HBTabbarFrame
//
//  Created by mass on 2017/11/29.
//  Copyright © 2017年 HB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBFrameConfig : NSObject


/**
 单例
 @return 实例
 */
+ (HBFrameConfig *)shareInstance;

/**
 APP开始加载,对应APPDelegate的第一个
 @param launchOptions 信息
 */
- (void)applicationDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

@end
