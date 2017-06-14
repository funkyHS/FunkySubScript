//
//  SubscriptAPI.m
//  FunkySubScript
//
//  Created by 胡晟 on 2017/6/14.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "SubscriptAPI.h"
#import "HSSubscribleVC.h"

@implementation SubscriptAPI


static SubscriptAPI *_shareInstance;

+ (instancetype)shareInstance {
    if (_shareInstance == nil) {
        _shareInstance = [[SubscriptAPI alloc] init];
    }
    return _shareInstance;
    
}

-(UIViewController *)subscriptVC {
    
    return [HSSubscribleVC new];
    
}

@end
