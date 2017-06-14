//
//  HSSubscribleVC.m
//  FunkySubScript
//
//  Created by 胡晟 on 2017/6/13.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "HSSubscribleVC.h"
#import "HSSementBarVC.h"
#import "HSRecommendController.h"
#import "HSSubscribeController.h"
#import "HSHistoryController.h"
#import "Base.h"

@interface HSSubscribleVC ()

@property (nonatomic, weak) HSSementBarVC *segmentBarVC;


@end

@implementation HSSubscribleVC

- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.segmentBarVC.segmentBar.frame = CGRectMake(0, 0, kScreenWidth, 44);
    self.navigationItem.titleView = self.segmentBarVC.segmentBar;
    self.segmentBarVC.view.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64);
    [self.view addSubview:self.segmentBarVC.view];
    
    NSArray *items = @[@"推荐", @"订阅", @"历史"];
    // 添加几个自控制器
    // 在contentView, 展示子控制器的视图内容
    [self.segmentBarVC setUpWithItems:items childVCs:@[[HSRecommendController new], [HSSubscribeController new], [HSHistoryController new]]];
    
    [self.segmentBarVC.segmentBar updateWithConfig:^(HSSegmentBarConfig *config) {
        //config.itemFont = [UIFont systemFontOfSize:15];
        config.indicatorExtraW = 0;
        config.barBtnW = kScreenWidth/3;
    }];
    
}
#pragma mark - 懒加载

- (HSSementBarVC *)segmentBarVC {
    if (!_segmentBarVC) {
        HSSementBarVC *vc = [[HSSementBarVC alloc] init];
        [self addChildViewController:vc];
        _segmentBarVC = vc;
    }
    return _segmentBarVC;
}
@end
