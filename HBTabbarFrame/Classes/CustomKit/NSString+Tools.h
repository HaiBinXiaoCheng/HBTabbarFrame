//
//  NSString+Tools.h
//  HB_iOS
//
//  Created by 彭彬 on 2017/9/7.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Tools)

/**
 计算普通文本的在label中的高度

 @param font 文本大小
 @param limtedW 限制宽度
 @return label高度
 */
- (CGFloat)heightForLabelWithFont:(UIFont *)font LimitedWidth:(CGFloat)limtedW;

/**
 计算普通文本的在label中的宽度
 
 @param font 文本大小
 @param limtedH 限制高度
 @return label宽度
 */
- (CGFloat)widthForLabelWithFont:(UIFont *)font LimitedHeight:(CGFloat)limtedH;

/**
 转换为Base64编码
 */
- (NSString *)base64EncodedString;
/**
 将Base64编码还原
 */
- (NSString *)base64DecodedString;


/**
 校验是否为手机号的方法

 @return 是否为11位数字的手机号
 */
-(BOOL)validatePhone;

/**
 校验密码
 6-20位英文字母、数字或符号(不能全是数字)

 @return 是否符合密码规则
 */
- (BOOL)validatePassword;

/**
 *  计算字符串字节长度，一个汉子代表两个字节，⚠️不包含表情符号等特殊符号
 *
 *  @param text 要计算长度的文本
 *
 *  @return 字节长度
 */
+(NSUInteger)unicodeLengthOfString:(NSString *)text;

/**
 获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
 
 @param aString 要获取首字母的字符串
 @return 首字母
 */
+ (NSString *)firstCharactor:(NSString *)aString;

@end
