//
//  HBUtils.m
//  HB_iOS
//
//  Created by mass on 2017/10/12.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import "HBUtils.h"

@implementation HBUtils

/**
 *  计算富文本的高度
 *
 *  @param attbutedText 富文本
 *  @param limitedWidth 限定宽度
 *
 *  @return 高度
 */
+ (CGFloat)heightForLabelWithAttbutedText:(NSAttributedString *)attbutedText limitedWidth:(CGFloat)limitedWidth {
    
    CGSize size = CGSizeMake(limitedWidth, CGFLOAT_MAX);
    CGRect rect = [attbutedText boundingRectWithSize:size options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin context:nil];
    return ceilf(rect.size.height);
}

/**
 压缩图片到指定大小，先将图片压尺寸到长款中小边<800.⚠️先压像素后压质量，适用于大小不超过1M的
 
 @param originalImage 原始图片
 @param maxKBSize 最大值，单位是KB
 @return    压缩后的图片data
 */
+ (NSData *)handleImage:(UIImage *)originalImage toMaxKBSize:(NSInteger)maxKBSize {
    CGSize originalsize = [originalImage size];
    UIImage* newImage = originalImage;
    //如果高与宽小边大于800，则开始压尺寸
    if (MIN(originalsize.width, originalsize.height)>800) {
        //压到小边小于800的新尺寸
        CGSize newSize = originalsize;
        //如果高>=宽
        if (originalsize.height>=originalsize.width) {
            CGFloat scale = originalsize.width/800.0f;
            newSize = CGSizeMake(800, (originalsize.height/scale));
        }else {
            CGFloat scale = originalsize.height/800.0f;
            newSize = CGSizeMake((originalsize.width/scale), 800);
        }
        UIGraphicsBeginImageContext(newSize);
        [originalImage drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    CGFloat scaleNum = 8;
    CGFloat factorNum = 0.1;
    NSData *imageData = UIImageJPEGRepresentation(newImage, scaleNum * factorNum);
    while (imageData.length > 1024*maxKBSize) {
        if (scaleNum>=5) {
            scaleNum-=1.5;
        }else if(factorNum>0.03){
            factorNum -= 0.03;
        }else {
            break;
        }
        imageData = UIImageJPEGRepresentation(newImage, scaleNum * 0.1);
    }
    return imageData;
}
/**
 *  转换image为Data，并且不超过指定大小 ⚠️只压质量，使用压缩后超过1M的地方
 *
 *  @param image 需要转化的图片
 *  @param maxM  最大长度，单位为M
 *
 *  @return 转化后的data
 */
+ (NSData *)convertImageToDataWith:(UIImage *)image maxDataLength:(CGFloat)maxM {
    
    CGFloat scaleNum = 8;
    CGFloat factorNum = 0.1;
    NSData *imageData = UIImageJPEGRepresentation(image, scaleNum * factorNum);
    while (imageData.length > 1024*1024*maxM) {
        if (scaleNum>=5) {
            scaleNum-=1.5;
        }else if(factorNum>0.03){
            factorNum -= 0.03;
        }else {
            break;
        }
        imageData = UIImageJPEGRepresentation(image, scaleNum * 0.1);
    }
    return imageData;
}
/**
 压缩图片到指定尺寸,

 @param originalImage 原图片
 @param newSide 图片小边的宽度
 @return 裁剪后的图片
 */
+ (UIImage *)compressWithOriginImage:(UIImage *)originalImage scaledToSmallSide:(CGFloat)newSide {
    CGSize originalsize = [originalImage size];
    UIImage* newImage = originalImage;
    //如果高与宽小边大于压缩图片到指定尺寸，则开始压尺寸
    if (MIN(originalsize.width, originalsize.height)>newSide) {
        //压到小边小于newSide的新尺寸
        CGSize newSize = originalsize;
        //如果高>=宽
        if (originalsize.height>=originalsize.width) {
            CGFloat scale = originalsize.width/newSide;
            newSize = CGSizeMake(newSide, (originalsize.height/scale));
        }else {
            CGFloat scale = originalsize.height/newSide;
            newSize = CGSizeMake((originalsize.width/scale), newSide);
        }
        UIGraphicsBeginImageContext(newSize);
        [originalImage drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return newImage ? newImage : originalImage;
}

+ (NSString*)base64forData:(NSData*)theData
{
    const uint8_t* input = (const uint8_t*)[theData bytes];
    NSInteger length = [theData length];
    
    static char table[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
    
    NSMutableData* data = [NSMutableData dataWithLength:((length + 2) / 3) * 4];
    uint8_t* output = (uint8_t*)data.mutableBytes;
    
    NSInteger i;
    for (i=0; i < length; i += 3) {
        NSInteger value = 0;
        NSInteger j;
        for (j = i; j < (i + 3); j++) {
            value <<= 8;
            
            if (j < length) {
                value |= (0xFF & input[j]);
            }
        }
        
        NSInteger theIndex = (i / 3) * 4;
        output[theIndex + 0] =                    table[(value >> 18) & 0x3F];
        output[theIndex + 1] =                    table[(value >> 12) & 0x3F];
        output[theIndex + 2] = (i + 1) < length ? table[(value >> 6)  & 0x3F] : '=';
        output[theIndex + 3] = (i + 2) < length ? table[(value >> 0)  & 0x3F] : '=';
    }
    
    return [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
}

@end
