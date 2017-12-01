//
//  HBPromptView.m
//  HB_iOS
//
//  Created by mass on 2017/10/18.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import "HBPromptView.h"
#import "HBDefines.h"
#import "UIColor+Hex.h"
#import "NSString+Tools.h"
#import "UIView+Frame.h"

#define KHUDAddtionBtnHeight            35
#define kHBPromptViewStartTop           ((self.frame.size.height)/5)

@interface HBPromptView ()

@property (nonatomic, strong) UIButton              *additionBtn;       //附加的功能按钮
@property (nonatomic, strong) UILabel               *promptLabel;       //提示label
@property (nonatomic, strong) UILabel               *otherPromptLabel;   //提示label的副标题

@end

@implementation HBPromptView

+ (instancetype)promptViewWithFrame:(CGRect)frame {
    HBPromptView *view = [[HBPromptView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}

- (void)showPromptViewWithAdditionBtnTitle:(NSString *)title WithPromptText:(NSString *)promptText OtherPrompt:(NSString *)otherPrompt action:(SEL)action WithTarget:(id)target {

    if (promptText) {
        self.promptLabel.text = promptText;
    }
    if (otherPrompt) {
        self.otherPromptLabel.text = otherPrompt;
    }
    if (title) {
        [self setAdditionBtnTitle:title];
    }
    if (action) {
        [self.additionBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)setAdditionBtnTitle:(NSString *)btnTitle {
    CGFloat btnWidth = [btnTitle widthForLabelWithFont:self.additionBtn.titleLabel.font LimitedHeight:KHUDAddtionBtnHeight];
    self.additionBtn.width = MAX(btnWidth+24, 100);
    self.additionBtn.titleLabel.text = btnTitle;//加这句是为了不让在改变文字的时候闪烁
    [self.additionBtn setTitle:btnTitle forState:UIControlStateNormal];
    //使btn的位置居中
    self.additionBtn.centerX = self.centerX;
}

- (UILabel *)promptLabel {
    if (_promptLabel == nil) {
        _promptLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, kHBPromptViewStartTop, kMAIN_SCREEN_WIDTH - 30, 25)];
        _promptLabel.numberOfLines = 0;
        _promptLabel.font = [UIFont systemFontOfSize:16];
        _promptLabel.textAlignment = NSTextAlignmentCenter;
        _promptLabel.textColor = [UIColor blackColor];
        [self addSubview:_promptLabel];
    }
    return _promptLabel;
}
- (UILabel *)otherPromptLabel {
    if (_otherPromptLabel == nil) {
        _otherPromptLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, _promptLabel.bottom+6, kMAIN_SCREEN_WIDTH - 30, 20)];
        _otherPromptLabel.font = [UIFont systemFontOfSize:15];
        _otherPromptLabel.textAlignment = NSTextAlignmentCenter;
        _otherPromptLabel.numberOfLines = 0;
        _otherPromptLabel.textColor = [UIColor darkGrayColor];
        [self addSubview:_otherPromptLabel];
    }
    return _otherPromptLabel;
}
- (UIButton *)additionBtn {
    if (_additionBtn == nil) {
        _additionBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        if (_otherPromptLabel) {
            _additionBtn.frame = CGRectMake((kMAIN_SCREEN_WIDTH - 100)/2, self.promptLabel.bottom+30, 100, KHUDAddtionBtnHeight);
        }else {
            _additionBtn.frame = CGRectMake((kMAIN_SCREEN_WIDTH - 100)/2, self.otherPromptLabel.bottom+10, 100, KHUDAddtionBtnHeight);
        }
        _additionBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        _additionBtn.layer.cornerRadius = 3.0f;
        _additionBtn.layer.masksToBounds = YES;
        _additionBtn.layer.borderWidth = 0.6f;
        _additionBtn.layer.borderColor = [UIColor HBOrangeHeightLightColor].CGColor;
        _additionBtn.titleLabel.text = @"重试";
        _additionBtn.backgroundColor = [UIColor HBOrangeColor];
        [_additionBtn setTitle:@"重试" forState:UIControlStateNormal];
        [_additionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _additionBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:_additionBtn];
    }
    return _additionBtn;
}


@end
