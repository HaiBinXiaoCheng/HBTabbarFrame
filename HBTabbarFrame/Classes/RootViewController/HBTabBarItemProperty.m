//
//  HBTabBarItemProperty.m
//  HBTabbarFrame
//
//  Created by mass on 2017/11/29.
//  Copyright © 2017年 HB. All rights reserved.
//

#import "HBTabBarItemProperty.h"

static NSString * const kTabBarTitle            =    @"TabTitle";
static NSString * const kTabBarClassName        =    @"className";
static NSString * const kTabBarIsSelected       =    @"isSelected";
static NSString * const kTabBarDefaultImage     =    @"defaultImage";
static NSString * const kTabBarSelectedImage    =    @"selectedImage";

@implementation HBTabBarItemProperty

- (instancetype)initWithControllersInfo:(NSDictionary *)dic {
    
    self = [super init];
    if (self) {
        if (dic && [dic isKindOfClass:[NSDictionary class]]) {
            _tabTitle = dic[kTabBarTitle];
            _className = dic[kTabBarClassName];
            _isSelected = [dic[kTabBarIsSelected] boolValue];
            _defaultImage = dic[kTabBarDefaultImage];
            _selectedImage = dic[kTabBarSelectedImage];
        }
        
    }
    return self;
}

@end
