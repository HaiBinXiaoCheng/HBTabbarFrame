//
//  HBViewController.h
//  HBNormalTabbarFrame
//
//  Created by mass on 2017/11/27.
//  Copyright © 2017年 HB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBNetwork.h"
#import "HBHUD.h"

@interface HBViewController : UIViewController

@property (nonatomic, strong)   HBNetwork *network;
@property (nonatomic, strong)   HBHUD     *HUD;

@end
