//
//  NSDateFormatter+singleton.h
//  Teld
//
//  Created by Andy on 15/11/25.
//  Copyright © 2015年 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (singleton)

/**
 *  NSDateFormatter使用单例
 *
 *  @return 单例
 */
+ (instancetype)shareInstance;

@end
