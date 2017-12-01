//
//  HBAlertToastView.h
//  HB_iOS
//
//  Created by 彭彬 on 2017/9/13.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBAlertToastView : UIView

/**
 *  初始化
 *
 *  @return 实例
 */
+ (instancetype)shareInstance;

/**
 *  设置展示内容
 */
- (void)setText:(NSString *)text;
/**
 *  设置展示的图片
 */
- (void)setImage:(UIImage *)image;

/**
 *  展示的动画效果
 */
- (void)show;

@end
