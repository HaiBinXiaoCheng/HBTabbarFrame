//
//  HBTabBarControllerMange.m
//  HBTabbarFrame
//
//  Created by mass on 2017/11/29.
//  Copyright © 2017年 HB. All rights reserved.
//

#import "HBTabBarControllerMange.h"
#import "HBTabBarItemProperty.h"

@implementation HBTabBarControllerMange

+ (HBTabBarController *)configTabBarController {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"HBTabBarConfig" ofType:@"plist"];
    NSArray *allTabs = [NSArray arrayWithContentsOfFile:path];
    // 从plist中读取Controllers的设置
    NSMutableArray *tabsBeanArr = [NSMutableArray array];
    NSInteger selectedIndex = 0;
    for (int i = 0; i < [allTabs count]; i++) {
        NSDictionary *tabBeanDic = allTabs[i];
        if (tabBeanDic) {
            HBTabBarItemProperty *bean = [[HBTabBarItemProperty alloc] initWithControllersInfo:tabBeanDic];
            [tabsBeanArr addObject:bean];
            if (bean.isSelected) {
                selectedIndex = i;
            }
        }
    }
    HBTabBarController *tabBarVC = [[HBTabBarController  alloc] initWithTabBarItems:tabsBeanArr];
    //设置选中的Tab
    tabBarVC.selectedIndex = selectedIndex;
    return tabBarVC;
}

@end
