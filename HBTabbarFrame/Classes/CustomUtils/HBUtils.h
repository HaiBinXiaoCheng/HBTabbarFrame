//
//  HBUtils.h
//  HB_iOS
//
//  Created by mass on 2017/10/12.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HBUtils : NSObject

/**
 *  计算富文本的高度
 *
 *  @param attbutedText 富文本
 *  @param limitedWidth 限定宽度
 *
 *  @return 高度
 */
+ (CGFloat)heightForLabelWithAttbutedText:(NSAttributedString *)attbutedText limitedWidth:(CGFloat)limitedWidth;


/**
 压缩图片到指定大小，先将图片压尺寸到长款中小边<800.⚠️先压像素后压质量，适用于大小 < 1M 的地方
 
 @param originalImage 原始图片
 @param maxKBSize 最大值，单位是KB
 @return    压缩后的图片data
 */
+ (NSData *)handleImage:(UIImage *)originalImage toMaxKBSize:(NSInteger)maxKBSize;

/**
 *  转换image为Data，并且不超过指定大小 ⚠️只压质量，使用压缩后超过1M的地方
 *
 *  @param image 需要转化的图片
 *  @param maxM  最大长度，单位为M
 *
 *  @return 转化后的data
 */
+ (NSData *)convertImageToDataWith:(UIImage *)image maxDataLength:(CGFloat)maxM;

/**
 压缩图片到指定尺寸,
 
 @param originalImage 原图片
 @param newSide 图片小边的宽度
 @return 裁剪后的图片
 */
+ (UIImage *)compressWithOriginImage:(UIImage *)originalImage scaledToSmallSide:(CGFloat)newSide;

+ (NSString*)base64forData:(NSData*)theData;

@end
