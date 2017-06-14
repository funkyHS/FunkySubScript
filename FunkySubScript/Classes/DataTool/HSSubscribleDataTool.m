//
//  HSSubscribleDataTool.m
//  FunkySubScript
//
//  Created by 胡晟 on 2017/6/14.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "HSSubscribleDataTool.h"
#import "HSSessionManager.h"

#import "Sington.h"

#import "Base.h"
#import "MJExtension.h"

@interface HSSubscribleDataTool()

@property (nonatomic, strong) HSSessionManager *sessionManager;

@end

@implementation HSSubscribleDataTool
singtonImplement(HSSubscribleDataTool)

-(HSSessionManager *)sessionManager {
    if (_sessionManager == nil) {
        _sessionManager = [[HSSessionManager alloc] init];
    }
    return _sessionManager;
}

/**
 *  订阅板块 - 网络请求API
 */

//http://mobile.ximalaya.com/feed/v1/recommend/classic?device=iPhone&pageId=1&pageSize=20&ts=1471058513.913570&tsuid=43342908
- (void)getRecommandList:(void(^)(NSArray <NSString *>*recommendList, NSError *error))result {
    
    NSString *url = [NSString stringWithFormat:@"%@%@", kBaseUrl, @"feed/v1/recommend/classic"];
    NSDictionary *param = @{
                            @"device": @"iPhone",
                            @"pageId": @1,
                            @"pageSize": @20,
                            @"ts": @"1471058513.913570",
                            @"tsuid":@"43342908"
                            };
    
    //    NSString *url = @"http://ifm.ximalaya.com/recsys-stream-query/recsys/stream/feed?device=iPhone";
    
    [self.sessionManager setValue:@"ting_v5.4.39_c5(CFNetwork, iPhone OS 10.0.1,iPhone8,1)" forHttpField:@"User-Agent"];
    [self.sessionManager setValue:@"domain=.ximalaya.com; path=/; channel=ios-b1; 1&_device=iPhone&5C60B916-A283-4DD3-98B1-8C42A8A889CF&5.4.39; impl=com.gemd.iting; NSUP=42E2BCFA%2C41B9139F%2C1477444624265; XUM=5C60B916-A283-4DD3-98B1-8C42A8A889CF; c-oper=%E6%9C%AA%E7%9F%A5; net-mode=WIFI; res=750%2C1334; idfa=5C60B916-A283-4DD3-98B1-8C42A8A889CF" forHttpField:@"Cookie"];
    
    
    [self.sessionManager request:RequestTypeGet urlStr:url parameter:param resultBlock:^(id responseObject, NSError *error) {
        
        NSArray *menuePicMs = [HSRecommends mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
        
        result(menuePicMs, error);
        
    }];
    
    
}


@end
