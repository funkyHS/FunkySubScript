//
//  SubscriptAPI.h
//  FunkySubScript
//
//  Created by 胡晟 on 2017/6/14.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubscriptAPI : NSObject

+ (instancetype)shareInstance;


/**
 获取订阅控制器
 */
@property (nonatomic, weak, readonly) UIViewController *subscriptVC;



@end
