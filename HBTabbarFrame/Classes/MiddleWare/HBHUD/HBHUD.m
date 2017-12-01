//
//  HBHUD.m
//  HB_iOS
//
//  Created by 彭彬 on 2017/9/13.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import "HBHUD.h"
#import "MBProgressHUD.h"
#import "HBDefines.h"
#import "UIView+Frame.h"
#import "UIColor+Hex.h"
#import "HBAlertToastView.h"
#import "HBPromptView.h"

@interface HBHUD ()

/**
 MBProgressHUDModeIndeterminate             菊花转圈
 MBProgressHUDModeDeterminate               实线⭕️
 MBProgressHUDModeDeterminateHorizontalBar  横条进度条
 MBProgressHUDModeAnnularDeterminate        浅色圆圈
 MBProgressHUDModeCustomView                自定义视图
 MBProgressHUDModeText                      只有文字
 */
@property (nonatomic, strong)   MBProgressHUD   *progressLoadingHUD;//转圈的loading

@property (nonatomic, strong)   MBProgressHUD   *progressToastHUD;//底部的toast

@property (nonatomic, strong) HBPromptView *promptView; //

@end

@implementation HBHUD

- (instancetype)initWithContainerView:(UIView *)containerView
{
    self = [super init];
    if (self) {
        _containerView = containerView;
    }
    return self;
}

//=============菊花加载==============
- (void)showLoadingOnWindowsWithDefault {
    [self showLoadingOnWindowsWithTitle:@"加载中..."];
}
- (void)showLoadingOnWindowsWithTitle:(NSString *)title {
    [self showLoadingWithTitle:title WithSupView:kKEY_WINDOW];
}
- (void)showLoadingOnContainerWithDefault {
    [self showLoadingOnContainerWithTitle:@"加载中..."];
}
- (void)showLoadingOnContainerWithTitle:(NSString *)title {
    [self showLoadingWithTitle:title WithSupView:_containerView];
}
- (void)showLoadingWithTitle:(NSString *)title WithSupView:(UIView *)view{
    if (!_progressLoadingHUD) {
        _progressLoadingHUD = [[MBProgressHUD alloc] initWithView:view];
//        _progressLoadingHUD.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        _progressLoadingHUD.mode = MBProgressHUDModeIndeterminate;
        _progressToastHUD.animationType = MBProgressHUDAnimationFade;
        _progressLoadingHUD.label.text = title;
        [view addSubview:_progressLoadingHUD];
        if (![view isEqual:kKEY_WINDOW]) {
            [_progressLoadingHUD setOffset:CGPointMake(0, -kNavigationBar_HEIGHT)];
        }else {
            [_progressLoadingHUD setOffset:CGPointMake(0, -kNavigationBar_HEIGHT/2)];
        }
    }
    [_progressLoadingHUD showAnimated:YES];
}
- (void)hiddenLoading {
    [_progressLoadingHUD hideAnimated:YES];
}


//==================展示底部toast========================
- (void)showToastWithText:(NSString *)toastStr {
    if (!_progressToastHUD) {
        _progressToastHUD = [[MBProgressHUD alloc] initWithView:_containerView];
        [_progressToastHUD setOffset:CGPointMake(0, -_containerView.height/2)];
        _progressToastHUD.mode = MBProgressHUDModeText;
        _progressToastHUD.animationType = MBProgressHUDAnimationZoom;
        _progressToastHUD.label.font = [UIFont systemFontOfSize:13];
        _progressToastHUD.label.textColor = [UIColor HBOrangeColor];
        [_containerView addSubview:_progressToastHUD];
        _progressToastHUD.userInteractionEnabled = NO;
    }
    _progressToastHUD.label.text = toastStr;
    [_progressToastHUD showAnimated:YES];
    
    //2.5秒后隐藏
    [_progressToastHUD hideAnimated:YES afterDelay:2.5];
}

//===============展示类似于alertView的在屏幕中间toast
/**
 *  在window上显示类似于alertView的在屏幕中间toast
 *
 *  @param text 显示内容
 *  @param right YES显示对号，NO显示错号
 */
- (void)showAlertToastWithText:(NSString *)text WithType:(BOOL)right {
    
    if (right) {
        [self showAlertToastWithText:text WithImage:nil];
    }else {
        [self showAlertToastWithText:text WithImage:[UIImage imageNamed:@"ToastWrong"]];
    }
}
/**
 *  在window上显示类似于alertView的在屏幕中间toast
 *
 *  @param text 要显示的文本
 *  @param image 要显示的Image，如果为空则显示默认的
 */
-(void)showAlertToastWithText:(NSString *)text WithImage:(UIImage *)image {
    
    HBAlertToastView *alertToastView = [HBAlertToastView shareInstance];
    if (image) {
        [alertToastView setImage:image];
    }else {
        [alertToastView setImage:[UIImage imageNamed:@"ToastRight"]];
    }
    [alertToastView setText:text];
    [kKEY_WINDOW addSubview:alertToastView];
    [alertToastView show];
}


//==================空白页提示========================
- (void)showPromptViewOn:(UIView *)supView WithAdditionBtnTitle:(NSString *)title WithPromptText:(NSString *)promptText OtherPrompt:(NSString *)otherPrompt action:(SEL)action WithTarget:(id)target {
    if (!_promptView || ![supView.subviews containsObject:_promptView]) {
        _promptView = [HBPromptView promptViewWithFrame:supView.bounds];
        [supView addSubview:_promptView];
    }
    [_promptView showPromptViewWithAdditionBtnTitle:title WithPromptText:promptText OtherPrompt:otherPrompt action:action WithTarget:target];
}
- (void)hiddenPromptViewFromSupView:(UIView *)supView {
    if (_promptView && [supView.subviews containsObject:_promptView]) {
        [_promptView removeFromSuperview];
        _promptView = nil;
    }
}


@end
