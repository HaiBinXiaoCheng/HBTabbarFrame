//
//  HBRefreshNormalHeader.m
//  HB_iOS
//
//  Created by mass on 2017/10/10.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import "HBRefreshNormalHeader.h"

@implementation HBRefreshNormalHeader

#pragma mark - 重写父类的方法
- (void)prepare {
    [super prepare];
    [self setTitle:@"下拉可以刷新哦" forState:MJRefreshStateIdle];
    [self setTitle:@"松开小手开始刷新" forState:MJRefreshStatePulling];
    [self setTitle:@"正在刷新数据中..." forState:MJRefreshStateRefreshing];
    [self setTitle:@"刷新完成" forState:MJRefreshStateWillRefresh];
}

@end
