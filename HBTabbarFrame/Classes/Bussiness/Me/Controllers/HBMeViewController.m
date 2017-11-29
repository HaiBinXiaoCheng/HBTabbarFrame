//
//  HBMeViewController.m
//  HBNormalTabbarFrame
//
//  Created by mass on 2017/11/27.
//  Copyright © 2017年 HB. All rights reserved.
//

#import "HBMeViewController.h"
#import "HBTestViewController.h"

@interface HBMeViewController ()

@end

@implementation HBMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 35)];
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnAction {
    [self.navigationController pushViewController:[[HBTestViewController alloc] init] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
