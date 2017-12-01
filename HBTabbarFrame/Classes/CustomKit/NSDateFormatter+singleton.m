//
//  NSDateFormatter+singleton.m
//  Teld
//
//  Created by Andy on 15/11/25.
//  Copyright © 2015年 Andy. All rights reserved.
//

#import "NSDateFormatter+singleton.h"

static NSDateFormatter *shareInstance = nil;
@implementation NSDateFormatter (singleton)

+ (instancetype)shareInstance {
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        shareInstance = [[NSDateFormatter alloc] init];
//        [shareInstance setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        [shareInstance setTimeZone:[NSTimeZone systemTimeZone]];
    });
    [shareInstance setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return shareInstance;
}

@end
