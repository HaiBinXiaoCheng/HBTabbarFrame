//
//  HBAlertToastView.m
//  HB_iOS
//
//  Created by 彭彬 on 2017/9/13.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import "HBAlertToastView.h"
#import "HBDefines.h"
#import "UIView+Frame.h"

#define kAlertToastAlphaViewW        84
#define kAlertToastAlphaViewH        88

static CGFloat kContentLabelLeft = 10;
static CGFloat kContentLabelHeight = 20;
static CGFloat kContentImageWidth = 24;

@interface HBAlertToastView()

@property (nonatomic, strong) UIView *bgAlphaView;
@property (nonatomic, strong) UIImageView   *contentImageView;
@property (nonatomic, strong) UILabel       *contentLabel;
@property (nonatomic, strong) NSTimer   *timer;

@end
static HBAlertToastView *shareInstance = nil;
@implementation HBAlertToastView

- (void)dealloc
{
    
}

/**
 *  初始化
 *
 *  @return 实例
 */
+ (instancetype)shareInstance {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        shareInstance = [[HBAlertToastView alloc] initWithFrame:CGRectMake(0, 0, kMAIN_SCREEN_WIDTH, kMAIN_SCREEN_HEIGHT)];
    });
    return shareInstance;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = NO;
        self.alpha = 0;
        [self prepareSubviews];
    }
    return self;
}

- (void)prepareSubviews {
    //半透明背景图
    _bgAlphaView = [[UIView alloc]initWithFrame:CGRectMake((kMAIN_SCREEN_WIDTH-kAlertToastAlphaViewW)/2, (kMAIN_SCREEN_HEIGHT-kAlertToastAlphaViewH)/3, kAlertToastAlphaViewW, kAlertToastAlphaViewH)];
    _bgAlphaView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.75];
    _bgAlphaView.layer.cornerRadius = 6;
    _bgAlphaView.layer.masksToBounds=YES;
    [self addSubview:_bgAlphaView];
    
    //图片
    _contentImageView = [[UIImageView alloc]initWithFrame:CGRectMake((kAlertToastAlphaViewW-kContentImageWidth)/2, 18, kContentImageWidth, kContentImageWidth)];
    _contentImageView.contentMode = UIViewContentModeScaleAspectFit;
    [_bgAlphaView addSubview:_contentImageView];
    
    //展示文字
    _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(kContentLabelLeft, (kAlertToastAlphaViewH-12-kContentLabelHeight), kAlertToastAlphaViewW-kContentLabelLeft*2, kContentLabelHeight)];
    _contentLabel.textColor = [UIColor whiteColor];
    _contentLabel.textAlignment = NSTextAlignmentCenter;
    _contentLabel.font = [UIFont systemFontOfSize:14.f];
    _contentLabel.numberOfLines = 0;
    [_bgAlphaView addSubview:_contentLabel];
}

/**
 *  设置展示内容
 */
- (void)setText:(NSString *)text {
    _contentLabel.text = text;
    CGSize fitSize;
    //小于四个字展示默认形状，大于四个字自适应文字宽度
    if (text.length>4) {
        fitSize = [_contentLabel sizeThatFits:CGSizeMake((kMAIN_SCREEN_WIDTH-30-kContentLabelLeft*2), kMAIN_SCREEN_HEIGHT)];
    }else {
        fitSize = CGSizeMake(kAlertToastAlphaViewW-kContentLabelLeft*2, 20);
    }
    _contentLabel.width     = fitSize.width;
    _contentLabel.height    = fitSize.height;
    _bgAlphaView.width      = fitSize.width+kContentLabelLeft*2;
    if (fitSize.height>20) {
        _bgAlphaView.height     = kAlertToastAlphaViewH+(fitSize.height-20);
    }else {
        _bgAlphaView.height     = kAlertToastAlphaViewH;
    }
    _bgAlphaView.left = (kMAIN_SCREEN_WIDTH-_bgAlphaView.width)/2;
    _contentImageView.left = (_bgAlphaView.width-kContentImageWidth)/2;
}
/**
 *  设置展示的图片
 */
- (void)setImage:(UIImage *)image {
    _contentImageView.image = image;
}

- (void)show {
    self.alpha = 1;
    self.transform = CGAffineTransformIdentity;
    [self endAnimation];
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.1 delay:1.4 options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionAllowUserInteraction animations:^{
        weakSelf.transform = CGAffineTransformMakeScale(0.8, 0.8);
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.35 delay:0.5 options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionAllowUserInteraction animations:^{
                weakSelf.alpha = 0;
            } completion:^(BOOL finished) {
                if (finished) {
                    [weakSelf removeFromSuperview];
                }
            }];
        }
    }];
}
- (void)endAnimation{
    [self.layer removeAllAnimations];//会结束动画，使finished变量返回Null
}


@end
