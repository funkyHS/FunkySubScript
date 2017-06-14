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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}


@end
