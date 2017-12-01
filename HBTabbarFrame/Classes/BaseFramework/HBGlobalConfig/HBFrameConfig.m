//
//  HBFrameConfig.m
//  HBTabbarFrame
//
//  Created by mass on 2017/11/29.
//  Copyright © 2017年 HB. All rights reserved.
//

#import "HBFrameConfig.h"
#import "HBTabBarControllerMange.h"
#import "HBDefines.h"

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
    _tabbarVC = [HBTabBarControllerMange configTabBarController];
    self.window.rootViewController = _tabbarVC;
}

- (HBNetwork *)globalNet {
    if (!_globalNet) {
        if ([self HBPresentingVC] && [self HBPresentingVC].network) {
            _globalNet = [self HBPresentingVC].network;
        }else {
            _globalNet = [[HBNetwork alloc] init];
        }
    }
    return _globalNet;
}

/**
 *  获取当前正在展示控制器的HUD
 *
 *  @return HUD
 */
- (HBHUD *)globalHUD {
    
    if (!_globalHUD) {
        if ([self HBPresentingVC] && [self HBPresentingVC].HUD) {
            _globalHUD = [self HBPresentingVC].HUD;
        }else {
            _globalHUD = [[HBHUD alloc] init];
        }
    }
    return _globalHUD;
}

//获取到当前控制器
- (HBViewController *)HBPresentingVC {
    
    UIWindow * window = kKEY_WINDOW;
    if (window.windowLevel != UIWindowLevelNormal){
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows){
            if (tmpWin.windowLevel == UIWindowLevelNormal){
                window = tmpWin;
                break;
            }
        }
    }
    UIViewController *result = window.rootViewController;
    while (result.presentedViewController) {
        result = result.presentedViewController;
    }
    if ([result isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabbar = (UITabBarController *)result;
        result = tabbar.selectedViewController;
    }
    if ([result isKindOfClass:[UINavigationController class]]) {
        result = [(UINavigationController *)result visibleViewController];
    }
    NSAssert([result isKindOfClass:[HBViewController class]], @"所有控制器都要继承与基类,检查代码");
    if ([result isKindOfClass:[HBViewController class]]) {
        return (HBViewController *)result;
    }
    return nil;
}

@end
