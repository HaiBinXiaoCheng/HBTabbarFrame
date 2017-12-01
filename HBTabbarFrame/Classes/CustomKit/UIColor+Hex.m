//
//  UIColor+Hex.m
//  HB_iOS
//
//  Created by 彭彬 on 2017/9/7.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor*) colorWithHex:(long)hexColor;
{
    return [UIColor colorWithHex:hexColor alpha:1.0];
}

+ (UIColor *)colorWithHex:(long)hexColor alpha:(CGFloat)opacity
{
    CGFloat red = ((CGFloat)((hexColor & 0xFF0000) >> 16))/255.0;
    CGFloat green = ((CGFloat)((hexColor & 0xFF00) >> 8))/255.0;
    CGFloat blue = ((CGFloat)(hexColor & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:opacity];
}

+ (UIColor *)getColorWithQulityLevel:(int)qulityLevel
{
    UIColor *color = [UIColor colorWithHex:0x42badc];
    if(qulityLevel<=50){
        color = [UIColor colorWithHex:0x29a532];
    }else if (qulityLevel > 50 &&  qulityLevel <= 100){
        color = [UIColor colorWithHex:0xc5e801];
    }else if (qulityLevel > 100 && qulityLevel <= 150){
        color = [UIColor colorWithHex:0xf49a0b];
    }else if (qulityLevel > 150 && qulityLevel <= 200){
        color = [UIColor colorWithHex:0xfb1c1c];
    }else if (qulityLevel > 200 && qulityLevel <= 300){
        color = [UIColor colorWithHex:0xaf00bf];
    }else if (qulityLevel > 300){
        color = [UIColor colorWithHex:0x6000b1];
    }
    return color;
}

+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size
{
    UIImage *img = nil;
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,
                                   color.CGColor);
    CGContextFillRect(context, rect);
    img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

+ (UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] < 6)
        return [UIColor clearColor];
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    //alpha
    NSString *aString = @"ff";
    if (cString.length >= 8) {
        range.location = 6;
        aString = [cString substringWithRange:range];
    }
    
    // Scan values
    unsigned int r, g, b, a;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    [[NSScanner scannerWithString:aString] scanHexInt:&a];
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:a/255.0f];
}

//===========基础色=========
/**
 项目色，橙色
 @return 0xE36912
 */
+ (UIColor *)HBOrangeColor {
    return [UIColor colorWithHex:0xE97E15];
}
/**
 项目色，暗橙色橙色
 @return 0xEA7E14
 */
+ (UIColor *)HBOrangeHeightLightColor {
    return [UIColor colorWithHex:0xEA7E14];
}
/**
 不可用
 @return 0xD7D8D9
 */
+ (UIColor *)HBUnEnableColor {
    return [UIColor colorWithHex:0xD7D8D9];
}
/**
 背景颜色
 @return 0xE9EFEF
 */
+ (UIColor *)HBBackGroundColor {
    return [UIColor colorWithHex:0xE9EFEF];
}

/**
 导航栏背景颜色

 @return 白色
 */
+ (UIColor *)HBNaviItemBackGroundColor {
    return [UIColor whiteColor];
}

/**
 导航栏背景颜色
 
 @return 白色
 */
+ (UIColor *)HBTabBarBackGroundColor {
    return [UIColor whiteColor];
}

/**
 *  Item分割线
 *
 *  @return UIColor类型
 */
+ (UIColor *)HBItemLineColor {
    return [UIColor colorWithHex:0xc8c7cc];
}


@end
