//
//  HSSubscribleDataTool.h
//  FunkySubScript
//
//  Created by 胡晟 on 2017/6/14.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HSRecommends.h"


@interface HSSubscribleDataTool : NSObject


+ (instancetype)shareInstance;


- (void)getRecommandList:(void(^)(NSArray <NSString *>*recommendList, NSError *error))result;


@end
