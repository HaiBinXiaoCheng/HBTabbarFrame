//
//  NSString+Tools.m
//  HB_iOS
//
//  Created by 彭彬 on 2017/9/7.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import "NSString+Tools.h"

@implementation NSString (Tools)

- (CGFloat)heightForLabelWithFont:(UIFont *)font LimitedWidth:(CGFloat)limtedW {
    CGSize size = CGSizeMake(limtedW, CGFLOAT_MAX);
    NSDictionary *attributes = @{NSFontAttributeName : font};
    CGRect rect = [self boundingRectWithSize:size options:(NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:attributes context:nil];
    return ceilf(rect.size.height);
}

- (CGFloat)widthForLabelWithFont:(UIFont *)font LimitedHeight:(CGFloat)limtedH {
    CGSize size = CGSizeMake(CGFLOAT_MAX,limtedH);
    NSDictionary *attributes = @{NSFontAttributeName : font};
    CGRect rect = [self boundingRectWithSize:size options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    return ceilf(rect.size.width);
}

- (NSString *)base64EncodedString;
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}

- (NSString *)base64DecodedString
{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:self options:0];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}


// 校验是否为手机号的方法
-(BOOL)validatePhone {
    
    NSString *phoneRange = @"^1(3[0-9]|4[0-9]|5[0-9]|7[0-9]|8[0-9])\\d{8}$";
    NSPredicate *regexMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRange];
    BOOL result = [regexMobile evaluateWithObject:self];
    if (result) {
        return YES;
    } else {
        return NO;
    }
}
// 校验密码
- (BOOL)validatePassword{
    // 6-20位英文字母、数字或符号(不能全是数字)
    NSString *regexRule = @"^(?!^\\d+$)[A-Za-z0-9\\-\\/\\:\\;\\(\\)\\$\\&\\@\\.\\,\\?\\!\\'\\[\\]\\{\\}\\#\\%\\^\\*\\+\\=\\_\\|\\~\\<\\>\\€\\£\\¥\\•]{6,20}$";
    NSPredicate *regexPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regexRule];
    BOOL result = [regexPredicate evaluateWithObject:self];
    if (result) {
        return YES;
    } else {
        return NO;
    }
}

/**
 *  计算字符串字节长度，一个汉子代表两个字节，⚠️不包含表情符号等特殊符号
 *
 *  @param text 要计算长度的文本
 *
 *  @return 字节长度
 */
+(NSUInteger)unicodeLengthOfString:(NSString *)text
{
    NSUInteger asciiLength = 0;
    for (NSUInteger i = 0; i < text.length; i++)
    {
        unichar uc = [text characterAtIndex: i];
        asciiLength += isascii(uc) ? 1 : 2;
    }
    return asciiLength;
}


/**
 获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)

 @param aString 要获取首字母的字符串
 @return 首字母
 */
+ (NSString *)firstCharactor:(NSString *)aString
{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *pinYin = [str capitalizedString];
    //获取并返回首字母
    return [pinYin substringToIndex:1];
}

@end
