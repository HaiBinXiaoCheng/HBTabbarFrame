//
//  HBTabBar.h
//  HBTabbarFrame
//
//  Created by mass on 2017/11/29.
//  Copyright © 2017年 HB. All rights reserved.
//

#import <UIKit/UIKit.h>

//tab页面个数,如果含有中间按钮的话,包含在内
typedef NS_ENUM(NSUInteger, HBTabBarUIType) {
    HBTabBarItemUIType_One      = 1,   //底部1个选项
    HBTabBarItemUIType_Two      = 2,   //底部2个选项
    HBTabBarItemUIType_Three    = 3,   //底部3个选项
    HBTabBarItemUIType_Four     = 4,   //底部4个选项
    HBTabBarItemUIType_Five     = 5,   //底部5个选项
};

@class HBTabBar;
@protocol HBTabBarDelegate <NSObject>

//点击了中间按钮
-(void)tabBar:(HBTabBar *)tabBar clickCenterButton:(UIButton *)sender;

@end

@interface HBTabBar : UITabBar

@property (nonatomic, weak) id<HBTabBarDelegate> tabBarDelegate;

/**
 初始化tabbar

 @param type 包含中间凸出Item的个数,最少一个,最多五个
 @param hasCneterItem 是否含有中间凸出Item
 @return TabBar
 */
+(instancetype)instanceCustomTabBarWithType:(HBTabBarUIType)type WithHasCenterItem:(BOOL)hasCneterItem;

/**
 选择调用
 更换原本TabBar上丑陋的背景与分割线
 
 @param bgColor 背景颜色
 @param shaowImage 分割线图片
 */
- (void)changeBackGroundColor:(UIColor *)bgColor AndShaowImage:(UIImage *)shaowImage;

@end
