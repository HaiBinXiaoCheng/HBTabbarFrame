//
//  HBPreferences.h
//  HBTabbarFrame
//
//  Created by mass on 2017/12/1.
//  Copyright © 2017年 HB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HBReachability.h"

@interface HBPreferences : NSObject

/**
 单例
 @return 实例
 */
+ (instancetype)shareInstance;

@property (nonatomic)   HBNetStatus netStatus;

@property (nonatomic) BOOL limitedPhotoGraphDevice;//是否有相机访问权限
@property (nonatomic) BOOL limitedPhotoLibraryDevice;//是否有相册访问权限

@end
