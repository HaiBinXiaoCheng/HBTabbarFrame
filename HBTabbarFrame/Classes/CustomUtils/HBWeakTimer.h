//
//  HBWeakTimer.h
//  HB_iOS
//
//  Created by 彭彬 on 2017/9/13.
//  Copyright © 2017年 Bin_Peng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^HBTimerHandler)(id userInfo);

@interface HBWeakTimer : NSObject

//普通方式返回Nstimer，参数跟nstime的初始化方法传参一样
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                     target:(id)aTarget
                                   selector:(SEL)aSelector
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)repeats;
//block方式返回Nstimer，参数跟nstime的初始化方法传参一样，block里面写方法
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      block:(HBTimerHandler)block
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)repeats;

@end
