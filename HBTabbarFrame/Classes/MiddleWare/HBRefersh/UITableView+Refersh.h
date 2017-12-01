//
//  UITableView+Refersh.h
//  HB_iOS
//
//  Created by 彭彬 on 2017/9/19.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Refersh)

- (void)customRefershHeaderWithRefreshingTarget:(id)target refreshingAction:(SEL)action;
- (void)customRefershFooterWithRefreshingTarget:(id)target refreshingAction:(SEL)action;

- (void)endRefreshing;
- (void)endRefreshingNoMoreData;

@end
