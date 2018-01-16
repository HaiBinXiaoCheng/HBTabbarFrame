//
//  HBFrameConfig.h
//  HBTabbarFrame
//
//  Created by mass on 2017/11/29.
//  Copyright © 2017年 HB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HBTabBarController.h"
#import "HBNetwork.h"
#import "HBHUD.h"
#import "HBNavigationController.h"

@interface HBFrameConfig : NSObject


/**
 单例
 @return 实例
 */
+ (HBFrameConfig *)shareInstance;

@property (nonatomic, strong)   UIWindow                  *window;
@property (nonatomic, strong)   HBTabBarController        *tabbarVC;
@property (nonatomic, strong)   HBNetwork                 *globalNet;
@property (nonatomic, strong)   HBHUD                     *globalHUD;
@property (nonatomic, strong)   UIViewController          *HBPresentingVC;
@property (nonatomic, strong)   HBNavigationController    *HBNavi;

/**
 APP开始加载,对应APPDelegate的第一个
 @param launchOptions 信息
 */
- (void)applicationDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

@end
