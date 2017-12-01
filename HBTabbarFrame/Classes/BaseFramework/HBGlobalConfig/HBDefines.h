//
//  HBDefines.h
//  HB_iOS
//
//  Created by 彭彬 on 2017/9/7.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#ifndef HBDefines_h
#define HBDefines_h

#endif /* HBDefines_h */

/**
 *  屏幕分辨率&&设备型号
 */
#define kKEY_WINDOW              ([[UIApplication sharedApplication].delegate window])
#define kMAIN_SCREEN_HEIGHT      ([[UIScreen mainScreen] bounds].size.height)
#define kMAIN_SCREEN_WIDTH       ([[UIScreen mainScreen] bounds].size.width)
#define kMAIN_SCREEN_SIZE        ([[UIScreen mainScreen] bounds].size)
#define kTAB_BAR_HEIGHT          (kIsiPhoneX ? (49+kiPhoneXBottomH) : (49))
#define kNavigationBar_HEIGHT    (44+kiPhoneStateBarH)

//设置一像素线
#define SINGLE_LINE_WIDTH           (1 / [UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET   ((1 / [UIScreen mainScreen].scale) / 2)
//系统版本号
#define kSystemVersion          [[[UIDevice currentDevice] systemVersion]  intValue]
//手机型号
#define kIsiPhoneX              (kMAIN_SCREEN_HEIGHT == 812)
#define kIsIphone320Width       (kMAIN_SCREEN_WIDTH == 320)//屏幕宽度为320，iphone4、4s、5、5s、5c
#define kIsIphone375Width       (kMAIN_SCREEN_WIDTH == 375)//屏幕宽度为375，iphone6、6s、7、8、X
#define kIsIphone414Width       (kMAIN_SCREEN_WIDTH >= 414)//屏幕宽度为414，iphone6p、6sp、7p、8p
//iPhoneX底部多出来的高度
#define kiPhoneXBottomH         (20)
//iPhoneX顶部多出来的高度
#define kiPhoneStateBarH            (kIsiPhoneX ? (44) : (20))


/**
 *  提示文本宏定义
 */
#define kRequestFailString      (@"网络在开小差，检查后再试吧")      //网络请求失败提示语


