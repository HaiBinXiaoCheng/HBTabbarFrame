//
//  HBTabBarController.h
//  HBTabbarFrame
//
//  Created by mass on 2017/11/29.
//  Copyright © 2017年 HB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBTabBarController : UITabBarController

- (instancetype)initWithTabBarItems:(NSArray *)tabBarItems;

@property (nonatomic, strong) UIColor *barItemTitleColor_normal;    //tabBar文字未选中的颜色
@property (nonatomic, strong) UIColor *barItemTitleColor_selected;  //tabBar文字选中的颜色

@end
