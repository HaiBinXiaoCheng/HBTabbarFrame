//
//  HBPromptView.h
//  HB_iOS
//
//  Created by mass on 2017/10/18.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HBPromptView : UIView

+ (instancetype)promptViewWithFrame:(CGRect)frame;

/**
 *  加载完成并展示自定义图片和自定义Title的按钮,如果不需要某一个控件，则穿nil
 *
 *  @param title       按钮Title
 *  @param promptText  第一行提示文字
 *  @param otherPrompt 第二行提示文字
 *  @param action      自定义的按钮动作
 */
- (void)showPromptViewWithAdditionBtnTitle:(NSString *)title WithPromptText:(NSString *)promptText OtherPrompt:(NSString *)otherPrompt action:(SEL)action WithTarget:(id)target;

@end
