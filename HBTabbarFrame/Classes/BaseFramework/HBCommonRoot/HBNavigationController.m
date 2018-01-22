//
//  HBNavigationController.m
//  HBNormalTabbarFrame
//
//  Created by mass on 2017/11/27.
//  Copyright © 2017年 HB. All rights reserved.
//

#import "HBNavigationController.h"

@interface HBNavigationController ()

@end

@implementation HBNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count > 0) {
        /* 自动显示和隐藏tabbar */
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


/**
 重写方法,使子控制器可以响应preferredStatusBarStyle方法

 @return 当前导航控制器最上面的一个控制器
 */
- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}
- (UIViewController *)childViewControllerForStatusBarHidden {
    return self.topViewController;
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
