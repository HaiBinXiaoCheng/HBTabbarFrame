//
//  NSObject+Help.h
//  HB_iOS
//
//  Created by 彭彬 on 2017/9/14.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Help)

- (BOOL)isStringValid;

- (BOOL)isDictionaryValid;

- (BOOL)isArrayValid;

// 请求是否正确，是否请求到正常数据
- (BOOL)isRequestDataSuccess;

@end
