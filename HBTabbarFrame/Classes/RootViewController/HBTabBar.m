//
//  HBTabBar.m
//  HBTabbarFrame
//
//  Created by mass on 2017/11/29.
//  Copyright © 2017年 HB. All rights reserved.
//

#import "HBTabBar.h"

@interface HBTabBar ()

@property (nonatomic) HBTabBarUIType type;
@property (nonatomic) BOOL hasCenterItem;
@property (nonatomic, strong) UIButton *centerTabBarItem; //

@end

@implementation HBTabBar
/**
 初始化tabbar
 
 @param type 包含中间凸出Item的个数,最少一个,最多五个
 @param hasCneterItem 是否含有中间凸出Item
 @return TabBar
 */
+(instancetype)instanceCustomTabBarWithType:(HBTabBarUIType)type WithHasCenterItem:(BOOL)hasCneterItem{
    NSAssert(!(type%2 == 0 && hasCneterItem), @"如果含有中间凸出Item的话,必须是奇数个Item,type是包含中间凸出Item的奥");
    HBTabBar *tabbar = [[HBTabBar alloc] initWithCustomTabBarWithType:type WithHasCenterItem:hasCneterItem];
    return tabbar;
}

- (instancetype)initWithCustomTabBarWithType:(HBTabBarUIType)type WithHasCenterItem:(BOOL)hasCneterItem
{
    self = [super init];
    if (self) {
        _type = type;
        _hasCenterItem = hasCneterItem;
        [self setUpSubViews];
    }
    return self;
}

//解决iPhone X中push的时候因为隐藏Tabbar的原因,tabBar上跳的问题
#pragma mark - Override Methods
- (void)setFrame:(CGRect)frame
{
    if (self.superview && CGRectGetMaxY(self.superview.bounds) !=CGRectGetMaxY(frame)) {
        frame.origin.y =CGRectGetHeight(self.superview.bounds) -CGRectGetHeight(frame);
    }
    [super setFrame:frame];
}

- (void)setUpSubViews {
    //如果不含有中间凸出按钮则不添加
    if (!_hasCenterItem) {
        return;
    }
    //添加中间按钮
    _centerTabBarItem = [UIButton buttonWithType:UIButtonTypeCustom];
    [_centerTabBarItem setImage:[UIImage imageNamed:@"tab_scan"] forState:UIControlStateNormal];
    [_centerTabBarItem setImage:[UIImage imageNamed:@"tab_scan_pressed"] forState:UIControlStateSelected];
    [_centerTabBarItem addTarget:self action:@selector(centerTabBarItemDidClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_centerTabBarItem];
}

//中间按钮点击事件
-(void)centerTabBarItemDidClick{
    if (self.tabBarDelegate && [self.tabBarDelegate respondsToSelector:@selector(tabBar:clickCenterButton:)]) {
        [self.tabBarDelegate tabBar:self clickCenterButton:_centerTabBarItem];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    //如果不含有中间凸出按钮则不用重新布局
    if (!_hasCenterItem) {
        return;
    }
    CGFloat width = self.frame.size.width/_type;
    Class class = NSClassFromString(@"UITabBarButton");
 
    for (UIView *view in self.subviews) {
        if ([view isEqual:self.centerTabBarItem]) {
            view.frame = CGRectMake(0, 0, width, self.frame.size.height);
            [view sizeToFit];
            view.center = CGPointMake(self.center.x, 10);
        }else if ([view isKindOfClass:class]) {
            CGRect frame = view.frame;
            //防止UIView *view in self.subviews 获取到的不是有序的
            int indexFromOrign = view.frame.origin.x/width;
            if (indexFromOrign >= (self.type - 1) / 2) {
                indexFromOrign++;
            }
            CGFloat x = indexFromOrign * width;
            //如果是系统的UITabBarButton，那么就调整子控件位置，空出中间位置
            view.frame = CGRectMake(x, view.frame.origin.y, width, frame.size.height);
        }
    }
    
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    //这一个判断是关键，不判断的话push到其他页面，点击发布按钮的位置也是会有反应的，这样就不好了
    //self.isHidden == NO 说明当前页面是有tabbar的，那么肯定是在导航控制器的根控制器页面
    //在导航控制器根控制器页面，那么我们就需要判断手指点击的位置是否在发布按钮身上
    //是的话让发布按钮自己处理点击事件，不是的话让系统去处理点击事件就可以了
    if (self.isHidden == NO) {
        //将当前tabbar的触摸点转换坐标系，转换到发布按钮的身上，生成一个新的点
        CGPoint newP = [self convertPoint:point toView:self.centerTabBarItem];
        
        //判断如果这个新的点是在发布按钮身上，那么处理点击事件最合适的view就是发布按钮
        if ([self.centerTabBarItem pointInside:newP withEvent:event]) {
            return self.centerTabBarItem;
        }else{//如果点不在发布按钮身上，直接让系统处理就可以了
            return [super hitTest:point withEvent:event];
        }
    }
    else {//tabbar隐藏了，那么说明已经push到其他的页面了，这个时候还是让系统去判断最合适的view处理就好了
        return [super hitTest:point withEvent:event];
    }
}



/**
 更换原本TabBar上丑陋的背景与分割线
 
 @param bgColor 背景颜色
 @param shaowImage 分割线图片
 */
- (void)changeBackGroundColor:(UIColor *)bgColor AndShaowImage:(UIImage *)shaowImage {
    //去除顶部很丑的border
    [self setShadowImage:[UIImage new]];
    [self setBackgroundImage:[[UIImage alloc]init]];
    //大背景
    self.backgroundColor = bgColor;
    UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -6, self.frame.size.width, 6)];
    lineImageView.image = shaowImage;//;
    [self insertSubview:lineImageView atIndex:0];
}



@end
