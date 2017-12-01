//
//  HBAlertView.m
//  HB_iOS
//
//  Created by 彭彬 on 2017/9/17.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import "HBAlertView.h"
#import "HBFrameConfig.h"

@implementation HBAlertView

+ (void)alertWithCallBackBlock:(UIAlertViewCallBackBlock)alertViewCallBackBlock title:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle cancelButtonName:(NSString *)cancelButtonName otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION {
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
    if (cancelButtonName) {
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonName style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            alertViewCallBackBlock(0);
        }];
        [alertVC addAction:cancelAction];
    }
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:otherButtonTitles style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        alertViewCallBackBlock(1);
    }];
    [alertVC addAction:alertAction];
    
    if(otherButtonTitles) {
        NSString *otherTitle = nil;
        va_list args;
        NSInteger alertActionNum = 2;
        va_start(args, otherButtonTitles);
        while((otherTitle = va_arg(args, NSString *))) {
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:otherTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                alertViewCallBackBlock(alertActionNum);
            }];
            [alertVC addAction:alertAction];
            alertActionNum++;
        }
        va_end(args);
    }
    [[HBFrameConfig shareInstance].HBPresentingVC.navigationController presentViewController:alertVC animated:YES completion:nil];
}

@end
