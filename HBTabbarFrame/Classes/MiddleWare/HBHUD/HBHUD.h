//
//  HBHUD.h
//  HB_iOS
//
//  Created by 彭彬 on 2017/9/13.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HBHUD : NSObject

@property (nonatomic, strong)   UIView *containerView;

- (instancetype)initWithContainerView:(UIView *)containerView;


//=============菊花加载==============

/**
 展示loading在window上，会盖住导航
 */
- (void)showLoadingOnWindowsWithDefault;
- (void)showLoadingOnWindowsWithTitle:(NSString *)title;
/**
 展示loading在Self.view上，不会盖住导航
 */
- (void)showLoadingOnContainerWithDefault;
- (void)showLoadingOnContainerWithTitle:(NSString *)title;
/**
 展示loading在自定义view上
 */
- (void)showLoadingWithTitle:(NSString *)title WithSupView:(UIView *)view;
- (void)hiddenLoading;

//===============底部toast==========
- (void)showToastWithText:(NSString *)toastStr;
//===============展示类似于alertView的在屏幕中间toast
/**
 *  在window上显示类似于alertView的在屏幕中间toast
 *
 *  @param text 显示内容
 *  @param right YES显示对号，NO显示错号
 */
- (void)showAlertToastWithText:(NSString *)text WithType:(BOOL)right;


//==================空白页提示========================
- (void)showPromptViewOn:(UIView *)supView WithAdditionBtnTitle:(NSString *)title WithPromptText:(NSString *)promptText OtherPrompt:(NSString *)otherPrompt action:(SEL)action WithTarget:(id)target;
- (void)hiddenPromptViewFromSupView:(UIView *)supView;

@end
