//
//  HSRecommendController.m
//  FunkySubScript
//
//  Created by 胡晟 on 2017/6/13.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "HSRecommendController.h"
#import "HSSubscribleDataTool.h"
#import "HSRecommendsCell.h"

@interface HSRecommendController ()

@property (nonatomic, strong)NSArray *recommendList;

@end

@implementation HSRecommendController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[HSSubscribleDataTool shareInstance] getRecommandList:^(NSArray<NSString *> *recommendList, NSError *error) {
        self.recommendList = recommendList;
        [self.tableView reloadData];
    }];
    
    [self initView];
}

- (void)initView
{
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 85;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.recommendList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HSRecommendsCell *cell = [HSRecommendsCell creatTableCellWithTableView:tableView];
    cell.recommends = self.recommendList[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    HSRecommends *recommends = self.recommendList[indexPath.row];
//    
//    HSAlbumDetailController *vc =[[HSAlbumDetailController alloc]init];
//    vc.albumId = recommends.albumId;
//    [self.navigationController pushViewController:vc animated:YES];
}


@end
