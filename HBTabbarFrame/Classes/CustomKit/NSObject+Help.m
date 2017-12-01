//
//  NSObject+Help.m
//  HB_iOS
//
//  Created by 彭彬 on 2017/9/14.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import "NSObject+Help.h"

@implementation NSObject (Help)

- (BOOL)isStringValid {
    
    if (self && [self isKindOfClass:[NSString class]]) {
        return YES;
    }
    else {
        return NO;
    }
}

- (BOOL)isDictionaryValid {
    
    if (self && [self isKindOfClass:[NSDictionary class]] && ![self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    else {
        return NO;
    }
}

- (BOOL)isArrayValid {
    
    if (self && [self isKindOfClass:[NSArray class]]) {
        return YES;
    }
    else {
        return NO;
    }
}

// 请求是否正确，是否请求到正常数据
- (BOOL)isRequestDataSuccess {
    
    if (self && [self isKindOfClass:[NSDictionary class]]) {
        return YES;
    }
    else {
        return NO;
    }
}

@end
