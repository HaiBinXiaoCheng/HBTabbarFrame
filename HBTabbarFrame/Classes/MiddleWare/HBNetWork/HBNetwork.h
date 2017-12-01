//
//  HBNetwork.h
//  HB_iOS
//
//  Created by 彭彬 on 2017/9/12.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

// 请求类型
typedef NS_ENUM(NSInteger, HBRequestType) {
    HBRequestType_Default = 0,         //默认请求方式
    HBRequestType_Get     = 1,         //GET请求
    HBRequestType_Post    = 1 << 1,    //POST请求
    HBRequestType_Put     = 1 << 2,    //PUT请求
//    HBRequestType_Delete  = 1 << 3     //Delete请求
};
typedef void(^TLDResponseSuccessBlock)(id operation, id resultData);
typedef void(^TLDResponseFailBlock)(id operation, NSError *error);
typedef void(^TLDResponseTimeOutBlock)(BOOL isLoginSuccess);

@interface HBNetwork : NSObject

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager; //

/**
 *  请求服务（便捷，参数少）
 *
 *  @param type         请求类型
 *  @param urlString    请求url
 *  @param paramsDic    请求参数
 *  @param successBlock 成功回调
 *  @param failBlock    失败回调
 */
- (void)doRequestWithType:(HBRequestType)type
                urlString:(NSString *)urlString
                paramsDic:(NSDictionary *)paramsDic
             successBlock:(void(^)(NSURLSessionDataTask *operation, id resultData))successBlock
                failBlock:(void(^)(NSURLSessionDataTask *operation, NSError *error))failBlock;


/**
 带cookie的请求

 @param type 请求类型
 @param urlString 请求url
 @param paramsDic 请求参数
 @param successBlock 成功回调
 @param failBlock 失败回调
 */
- (void)doRequestUseCookieWithType:(HBRequestType)type
                         urlString:(NSString *)urlString
                         paramsDic:(NSDictionary *)paramsDic
                      successBlock:(void(^)(NSURLSessionDataTask *operation, id resultData))successBlock
                         failBlock:(void(^)(NSURLSessionDataTask *operation, NSError *error))failBlock
                      timeOutBlock:(void(^)(BOOL isLoginSuccess))timeoutBlock;


/**
 上传单张图片
 
 @param urlString url
 @param paramsDic 入参
 @param formImage 图片
 @param maxKBSize 压缩大小
 @param successBlock 上传成功
 @param failBlock 上传失败
 */
- (void)doRequestPostImageWithUrlString:(NSString *)urlString
                              paramsDic:(NSDictionary *)paramsDic
                              formImage:(UIImage *)formImage imageMaxKBSize:(NSInteger)maxKBSize
                           successBlock:(void(^)(NSURLSessionDataTask *operation, id resultData))successBlock
                              failBlock:(void(^)(NSURLSessionDataTask *operation, NSError *error))failBlock
                           timeOutBlock:(void(^)(BOOL isLoginSuccess))timeoutBlock;

/**
 上传多张图片,上传多张图片,并且每张图片的名字不一样
 
 @param urlString url
 @param paramsDic 入参
 @param formImages 图片数组
 @param fileNameArr 图片上传的文件名字
 @param maxKBSize 压缩大小,如果不想压缩可以吧此值设置大一些
 @param successBlock 上传成功
 @param failBlock 上传失败
 */
- (void)doRequestPostImagesWithUrlString:(NSString *)urlString
                               paramsDic:(NSDictionary *)paramsDic
                            formImageArr:(NSArray<UIImage *> *)formImages FileNameArr:(NSArray <NSString *>*)fileNameArr imageMaxKBSize:(NSInteger)maxKBSize
                            successBlock:(void(^)(NSURLSessionDataTask *operation, id resultData))successBlock
                               failBlock:(void(^)(NSURLSessionDataTask *operation, NSError *error))failBlock
                            timeOutBlock:(void(^)(BOOL isLoginSuccess))timeoutBlock;

/**
 判断请求结果是否正确

 @param resultData 请求成功后返回的数据字典
 @param msgStr  错误提示，穿地址（&msgStr）
 @return 数据是否正确，并且数据正常
 */
- (BOOL)requestSuccessWithResultData:(id)resultData withMsg:(NSString **)msgStr;

@end
