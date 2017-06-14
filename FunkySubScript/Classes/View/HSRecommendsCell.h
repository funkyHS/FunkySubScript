//
//  HSRecommendsCell.h
//  FunkySubScript
//
//  Created by 胡晟 on 2017/6/14.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HSRecommends;

@interface HSRecommendsCell : UITableViewCell


@property(nonatomic, strong) HSRecommends *recommends;


+ (instancetype)creatTableCellWithTableView:(UITableView *)tableView;

@end
