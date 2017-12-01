//
//  HBRefreshAutoNormalFooter.m
//  HB_iOS
//
//  Created by mass on 2017/10/10.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import "HBRefreshAutoNormalFooter.h"

@implementation HBRefreshAutoNormalFooter

- (void)prepare {
    [super prepare];
    [self setTitle:@"点击或上拉加载更多" forState:MJRefreshStateIdle];
    [self setTitle:@"松开小手加载更多" forState:MJRefreshStatePulling];
    [self setTitle:@"加载中，请稍等..." forState:MJRefreshStateRefreshing];
    [self setTitle:@"加载完成" forState:MJRefreshStateWillRefresh];
    [self setTitle:@"没有更多数据了哦" forState:MJRefreshStateNoMoreData];
}

@end
