//
//  HSSubscribeController.m
//  FunkySubScript
//
//  Created by 胡晟 on 2017/6/13.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "HSSubscribeController.h"
#import "UITableView+HSEmptyData.h"

@interface HSSubscribeController ()

@end

@implementation HSSubscribeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView tableViewDisplayWithMessage:@"你还没有订阅人家啦\n人家好想哭奥~" ifNecessaryForRowCount:0];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


@end
