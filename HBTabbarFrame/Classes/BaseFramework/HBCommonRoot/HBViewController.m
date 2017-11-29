//
//  HBViewController.m
//  HBNormalTabbarFrame
//
//  Created by mass on 2017/11/27.
//  Copyright © 2017年 HB. All rights reserved.
//

#import "HBViewController.h"
//#import "HBDefines.h"

@interface HBViewController ()

@property (nonatomic, strong) UILabel *titleLabel; //导航栏标题

@end

@implementation HBViewController {
    NSString *_title;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
}

//- (void)setTitle:(NSString *)title {
//    _title = title;
//   self.titleLabel.text = title;
//}
//- (NSString *)title {
//
//    return _title ? : @"";
//}

//- (HBNetwork *)network {
//    if (!_network) {
//        _network = [[HBNetwork alloc] init];
//    }
//    return _network;
//}
//
//- (HBHUD *)HUD {
//    if (!_HUD) {
//        _HUD = [[HBHUD alloc] initWithContainerView:self.view];
//    }
//    return _HUD;
//}

//- (UILabel *)titleLabel {
//    if (!_titleLabel) {
//        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kMAIN_SCREEN_WIDTH, 44)];
//        _titleLabel.textColor = [UIColor blackColor];
//        _titleLabel.font = [UIFont systemFontOfSize:18.0f];
//        _titleLabel.textAlignment = NSTextAlignmentCenter;
//        self.navigationItem.titleView = _titleLabel;
//    }
//    return _titleLabel;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
