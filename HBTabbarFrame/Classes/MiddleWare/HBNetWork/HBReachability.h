//
//  HBReachability.h
//  HB_iOS
//
//  Created by 彭彬 on 2017/9/11.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, HBNetStatus) {
    HBNetStatus_None      =   0,
    HBNetStatus_WiFi      =   1,
    HBNetStatus_GPRS      =   2,
    HBNetStatus_UnKonw    =   3,
};

@interface HBReachability : NSObject

+ (void)reachabilityNetStatus;

@end
