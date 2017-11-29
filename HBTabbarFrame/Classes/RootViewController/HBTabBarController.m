//
//  HBTabBarController.m
//  HBTabbarFrame
//
//  Created by mass on 2017/11/29.
//  Copyright © 2017年 HB. All rights reserved.
//

#import "HBTabBarController.h"
#import "HBTabBarItemProperty.h"
#import "HBViewController.h"
#import "HBNavigationController.h"
#import "HBTabBar.h"

@interface HBTabBarController ()<HBTabBarDelegate>
@property (nonatomic, strong) NSArray *tabBarItemArr; //item数组,不包含中间凸出按钮
@end

@implementation HBTabBarController

- (instancetype)initWithTabBarItems:(NSArray *)tabBarItems
{
    self = [super init];
    if (self) {
        _tabBarItemArr = tabBarItems;
        [self configUI];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)configUI {
    [self configChildVC];
    //kvo形式添加自定义的 UITabBar
    HBTabBar *tab = [HBTabBar instanceCustomTabBarWithType:_tabBarItemArr.count+1 WithHasCenterItem:YES];
    tab.tabBarDelegate = self;
    [self setValue:tab forKey:@"tabBar"];
    //去除丑陋的分割线并设置背景色和分割线
    [tab changeBackGroundColor:[UIColor whiteColor] AndShaowImage:[UIImage imageNamed:@"tabbar_line"]];
}

- (void)configChildVC {
    for (HBTabBarItemProperty *tabBarItem in _tabBarItemArr) {
        HBViewController *childVC = [[NSClassFromString(tabBarItem.className) alloc] init];
        // 设置子控制器的tabBarItem图片
        childVC.tabBarItem.image = [UIImage imageNamed:tabBarItem.defaultImage];
         // 禁用图片渲染
        childVC.tabBarItem.selectedImage = [[UIImage imageNamed:tabBarItem.selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        // 设置子控制器的文字(可以设置tabBar和navigationBar的文字)
        childVC.tabBarItem.title = tabBarItem.tabTitle;
        // 设置文字的样式
        [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]} forState:UIControlStateNormal];
        [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]} forState:UIControlStateSelected];
        // 为子控制器包装导航控制器
        HBNavigationController *navigationVC = [[HBNavigationController alloc] initWithRootViewController:childVC];
        // 添加子控制器
        [self addChildViewController:navigationVC];
    }
}

#pragma mark --HBTabBarDelegate--
//点击了中间按钮
-(void)tabBar:(HBTabBar *)tabBar clickCenterButton:(UIButton *)sender {
    NSLog(@"1234567890-");
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
