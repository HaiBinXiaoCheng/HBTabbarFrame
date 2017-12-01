//
//  HBPreferences.m
//  HBTabbarFrame
//
//  Created by mass on 2017/12/1.
//  Copyright © 2017年 HB. All rights reserved.
//

#import "HBPreferences.h"
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>
#import "HBAlertView.h"

static HBPreferences *shareInstance = nil;

@implementation HBPreferences

+ (instancetype)shareInstance {
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        shareInstance = [[HBPreferences alloc] init];
    });
    return shareInstance;
}

- (BOOL)limitedPhotoGraphDevice {
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if(authStatus == AVAuthorizationStatusRestricted || authStatus ==AVAuthorizationStatusDenied) {
        //AVAuthorizationStatusRestricted:此应用程序没有被授权访问的照片数据。可能是家长控制权限
        //AVAuthorizationStatusDenied:用户已经明确否认了这一照片数据的应用程序访问
        //跳到APP的设置页面
        [HBAlertView alertWithCallBackBlock:^(NSInteger buttonIndex) {
            if (buttonIndex == 1) {
                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                if ([[UIApplication sharedApplication]canOpenURL:url]) {
                    [[UIApplication sharedApplication]openURL:url];
                }
            }
        } title:@"😢未获得相机授权" message:@"请在iPhone的“设置>隐私>相机”界面中打开" preferredStyle:UIAlertControllerStyleAlert cancelButtonName:@"取消" otherButtonTitles:@"设置", nil];
        return NO;
    }
    return YES;
}

- (BOOL)limitedPhotoLibraryDevice {
    
    PHAuthorizationStatus authStatus = [PHPhotoLibrary authorizationStatus];
    if(authStatus == PHAuthorizationStatusRestricted || authStatus ==PHAuthorizationStatusDenied) {
        //跳到APP的设置页面
        [HBAlertView alertWithCallBackBlock:^(NSInteger buttonIndex) {
            if (buttonIndex == 1) {
                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                if ([[UIApplication sharedApplication]canOpenURL:url]) {
                    [[UIApplication sharedApplication]openURL:url];
                }
            }
        } title:@"😢未获得相册授权" message:@"请在iPhone的“设置>隐私>照片”界面中打开" preferredStyle:UIAlertControllerStyleAlert cancelButtonName:@"取消" otherButtonTitles:@"设置", nil];
        return NO;
    }
    return YES;
}


@end
