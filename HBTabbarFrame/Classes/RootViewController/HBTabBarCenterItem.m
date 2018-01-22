//
//  HBTabBarCenterItem.m
//  HBTabbarFrame
//
//  Created by mass on 2017/11/29.
//  Copyright © 2017年 HB. All rights reserved.
//

#import "HBTabBarCenterItem.h"

@implementation HBTabBarCenterItem


/**
 初始化

 @return 自定义中间按钮
 */
+ (instancetype)initializeTabBarCenterItem {
    HBTabBarCenterItem *tabBarItem = [HBTabBarCenterItem buttonWithType:UIButtonTypeCustom];
    [tabBarItem setImage:[UIImage imageNamed:@"tab_scan"] forState:UIControlStateNormal];
    [tabBarItem setImage:[UIImage imageNamed:@"tab_scan_pressed"] forState:UIControlStateSelected];
    return tabBarItem;
}

@end
