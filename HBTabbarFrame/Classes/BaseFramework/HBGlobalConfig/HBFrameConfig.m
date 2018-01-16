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
#import "HBViewController.h"

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
        HBViewController *presentingVC = (HBViewController *)[self HBPresentingVC];
        if (presentingVC && [presentingVC isKindOfClass:[HBViewController class]] && presentingVC.network) {
            _globalNet = presentingVC.network;
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
        HBViewController *presentingVC = (HBViewController *)[self HBPresentingVC];
        if (presentingVC && [presentingVC isKindOfClass:[HBViewController class]] && presentingVC.HUD) {
            _globalHUD = presentingVC.HUD;
        }else {
            _globalHUD = [[HBHUD alloc] init];
        }
    }
    return _globalHUD;
}

//获取到当前控制器
- (UIViewController *)HBPresentingVC {
    
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
    NSAssert([result isKindOfClass:[HBViewController class]], @"所有从这里走出去的控制器控都要继承基类HBViewController,检查代码后重试");
    return result;
}
//获取当前页面的导航栏,少用,多用self.navi
- (HBNavigationController *)HBNavi
{
    UINavigationController *navi = [self HBPresentingVC].navigationController;
    return (HBNavigationController *)navi;
}

@end
