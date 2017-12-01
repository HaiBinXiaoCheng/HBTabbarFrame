//
//  UITableView+Refersh.m
//  HB_iOS
//
//  Created by 彭彬 on 2017/9/19.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import "UITableView+Refersh.h"
#import "MJRefresh.h"
#import "HBRefreshNormalHeader.h"
#import "HBRefreshAutoNormalFooter.h"

@implementation UITableView (Refersh)

- (void)customRefershHeaderWithRefreshingTarget:(id)target refreshingAction:(SEL)action {
    
    self.mj_header = [HBRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:action];
}

- (void)customRefershFooterWithRefreshingTarget:(id)target refreshingAction:(SEL)action {
    
    self.mj_footer = [HBRefreshAutoNormalFooter footerWithRefreshingTarget:target refreshingAction:action];
}

- (void)endRefreshing {
    if (self.mj_header.isRefreshing) {
        [self.mj_header endRefreshing];
    }
    if (self.mj_footer.isRefreshing) {
        [self.mj_footer endRefreshing];
    }
}

- (void)endRefreshingNoMoreData {
    if (self.mj_header.isRefreshing) {
        [self.mj_header endRefreshing];
    }
    [self.mj_footer endRefreshingWithNoMoreData];
}

@end
