//
//  UIColor+Hex.h
//  HB_iOS
//
//  Created by 彭彬 on 2017/9/7.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

/**
 色值转换成UIColor

 @param     hexColor 16进制色值
 @return    UIColor类型
 */
+ (UIColor *)colorWithHex:(long)hexColor;
/**
 色值转换成UIColor
 
 @param     hexColor 16进制色值
 @param     opacity 颜色的透明度0~1
 @return    UIColor类型
 */
+ (UIColor *)colorWithHex:(long)hexColor alpha:(CGFloat)opacity;

+ (UIColor *)getColorWithQulityLevel:(int)qulityLevel;

+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;
+ (UIColor *) colorWithHexString: (NSString *)color;

//===========基础色=========

/**
 项目色，橙色
 @return 0xE36912
 */
+ (UIColor *)HBOrangeColor;
/**
 项目色，暗橙色橙色
 @return 0xEA7E14
 */
+ (UIColor *)HBOrangeHeightLightColor;
/**
 不可用
 @return 0xD7D8D9
 */
+ (UIColor *)HBUnEnableColor;
/**
 背景颜色
 @return 0xE9EFEF
 */
+ (UIColor *)HBBackGroundColor;

/**
 导航栏背景颜色
 
 @return 白色
 */
+ (UIColor *)HBNaviItemBackGroundColor;
/**
 导航栏背景颜色
 
 @return 白色
 */
+ (UIColor *)HBTabBarBackGroundColor;
/**
 *  Item分割线
 *
 *  @return UIColor类型
 */
+ (UIColor *)HBItemLineColor;


@end
