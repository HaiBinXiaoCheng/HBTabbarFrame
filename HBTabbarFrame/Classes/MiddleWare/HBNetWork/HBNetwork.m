//
//  HBNetwork.m
//  HB_iOS
//
//  Created by 彭彬 on 2017/9/12.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import "HBNetwork.h"
#import "NSDateFormatter+singleton.h"
#import "HBUtils.h"

@implementation HBNetwork

- (AFHTTPSessionManager *)sessionManager {
    if (!_sessionManager) {
        _sessionManager = [AFHTTPSessionManager manager];
        _sessionManager.requestSerializer.timeoutInterval = 60.0f;
        _sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/xml,"@"application/json", @"text/json",@"text/plain", @"text/javascript",@"text/html",@"text/plain",@"image/png", nil];
    }
    return _sessionManager;
}

- (void)doRequestUseCookieWithType:(HBRequestType)type
                urlString:(NSString *)urlString
                paramsDic:(NSDictionary *)paramsDic
             successBlock:(void(^)(NSURLSessionDataTask *operation, id resultData))successBlock
                failBlock:(void(^)(NSURLSessionDataTask *operation, NSError *error))failBlock
                      timeOutBlock:(void(^)(BOOL isLoginSuccess))timeoutBlock {
    [self doRequestIsUseCookie:YES WithType:type urlString:urlString paramsDic:paramsDic successBlock:successBlock failBlock:failBlock timeOutBlock:timeoutBlock];
}
- (void)doRequestWithType:(HBRequestType)type
                urlString:(NSString *)urlString
                paramsDic:(NSDictionary *)paramsDic
             successBlock:(void(^)(NSURLSessionDataTask *operation, id resultData))successBlock
                failBlock:(void(^)(NSURLSessionDataTask *operation, NSError *error))failBlock {
    
    [self doRequestIsUseCookie:NO WithType:type urlString:urlString paramsDic:paramsDic successBlock:successBlock failBlock:failBlock timeOutBlock:nil];
    
}

- (void)doRequestIsUseCookie:(BOOL)isUserCookie
                    WithType:(HBRequestType)type
                urlString:(NSString *)urlString
                paramsDic:(NSDictionary *)paramsDic
             successBlock:(void(^)(NSURLSessionDataTask *operation, id resultData))successBlock
                   failBlock:(void(^)(NSURLSessionDataTask *operation, NSError *error))failBlock
                timeOutBlock:(void(^)(BOOL isLoginSuccess))timeoutBlock {
    
    if (type == HBRequestType_Get || type == HBRequestType_Default) {
        [self.sessionManager GET:urlString parameters:paramsDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

                if (successBlock) {
                    successBlock(task,responseObject);
                }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failBlock) {
                failBlock(task,error);
            }
        }];
        
    }else if (type == HBRequestType_Post) {
        
        [self.sessionManager POST:urlString parameters:paramsDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (successBlock) {
                successBlock(task,responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failBlock) {
                failBlock(task,error);
            }
        }];
        
    }else if(type == HBRequestType_Put){
        [self.sessionManager PUT:urlString parameters:paramsDic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (successBlock) {
                successBlock(task,responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failBlock) {
                failBlock(task,error);
            }
        }];
    }
}


/**
 上传单张图片

 @param urlString url
 @param paramsDic 入参
 @param formImage 图片
 @param maxKBSize 压缩大小，如果不想压缩可以吧此值设置大一些
 @param successBlock 上传成功
 @param failBlock 上传失败
 */
- (void)doRequestPostImageWithUrlString:(NSString *)urlString
                              paramsDic:(NSDictionary *)paramsDic
                           formImage:(UIImage *)formImage imageMaxKBSize:(NSInteger)maxKBSize
                           successBlock:(void(^)(NSURLSessionDataTask *operation, id resultData))successBlock
                              failBlock:(void(^)(NSURLSessionDataTask *operation, NSError *error))failBlock
                           timeOutBlock:(void(^)(BOOL isLoginSuccess))timeoutBlock {
    NSArray *formImageArr = @[formImage];
    [self doRequestPostImagesWithUrlString:urlString paramsDic:paramsDic formImageArr:formImageArr FileNameArr:nil imageMaxKBSize:maxKBSize successBlock:successBlock failBlock:failBlock timeOutBlock:timeoutBlock];
}

/**
 上传多张图片,
 
 @param urlString url
 @param paramsDic 入参
 @param formImages 图片数组
 @param fileNameArr 图片上传的文件名字,如果穿空,则名字都一样为avatar
 @param maxKBSize 压缩大小,如果不想压缩可以吧此值设置大一些
 @param successBlock 上传成功
 @param failBlock 上传失败
 */
- (void)doRequestPostImagesWithUrlString:(NSString *)urlString
                               paramsDic:(NSDictionary *)paramsDic
                            formImageArr:(NSArray<UIImage *> *)formImages FileNameArr:(NSArray <NSString *>*)fileNameArr imageMaxKBSize:(NSInteger)maxKBSize
                            successBlock:(void(^)(NSURLSessionDataTask *operation, id resultData))successBlock
                               failBlock:(void(^)(NSURLSessionDataTask *operation, NSError *error))failBlock
                            timeOutBlock:(void(^)(BOOL isLoginSuccess))timeoutBlock{

    [self.sessionManager POST:urlString parameters:paramsDic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //dataFormatter单例
        NSDateFormatter *dataFormatter = [NSDateFormatter shareInstance];
        [dataFormatter setDateFormat:@"yyyyMMddHHmmss"];
        NSString *nameStr = @"avatar";
        int i = 0;
        for (UIImage *image in formImages) {
            if (fileNameArr && fileNameArr.count>i) {
                nameStr = fileNameArr[i];
            }
            //处理图片大小
            NSData *imageData = [HBUtils handleImage:image toMaxKBSize:maxKBSize];
            NSString *nowDate = [dataFormatter stringFromDate:[NSDate date]];
            [formData appendPartWithFileData:imageData name:nameStr fileName:[NSString stringWithFormat:@"%@%d.jpg",nowDate,i] mimeType:@"image/*"];
            i++;
        }
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) {
            successBlock(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failBlock) {
            failBlock(task,error);
        }
    }];
}


/**
 判断请求结果是否正确
 
 @param resultData 请求成功后返回的数据字典
 @return 数据是否正确，并且数据正常
 */
- (BOOL)requestSuccessWithResultData:(id)resultData withMsg:(NSString **)msgStr {
    if (!resultData || ![resultData isKindOfClass:[NSDictionary class]] || [resultData isKindOfClass:[NSNull class]]) {
        *msgStr = @"服务器错误";
        return NO;
    }
    if ([resultData[@"code"] integerValue] != 1) {
        if (resultData[@"msg"]) {
            *msgStr = resultData[@"msg"];
        }
        return NO;
    }
    return YES;
}


@end
