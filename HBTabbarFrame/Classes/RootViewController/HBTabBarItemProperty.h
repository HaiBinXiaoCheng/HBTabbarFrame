//
//  HBTabBarItemProperty.h
//  HBTabbarFrame
//
//  Created by mass on 2017/11/29.
//  Copyright © 2017年 HB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBTabBarItemProperty : NSObject

// tab的title
@property (nonatomic, copy) NSString            *tabTitle;
// tab上对应viewController的类名
@property (nonatomic) NSString                  *className;
// tab是否点击
@property (nonatomic) BOOL                      isSelected;
// tabBar上默认图片名
@property (nonatomic, copy) NSString            *defaultImage;
// tabBar上点击态图片名
@property (nonatomic, copy) NSString            *selectedImage;


/**
 *  设置每个tabBar的属性
 *
 *  @param dic 从plist中读取的信息
 *
 *  @return HBTabPropertyBean实例
 */
- (instancetype)initWithControllersInfo:(NSDictionary *)dic;

@end
