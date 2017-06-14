//
//  HSRecommendsCell.m
//  FunkySubScript
//
//  Created by 胡晟 on 2017/6/14.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "HSRecommendsCell.h"
#import "HSRecommends.h"
#import "UIImageView+HSExtension.h"
#import "UIView+HSLayout.h"


@interface HSRecommendsCell ()

@property (weak, nonatomic) IBOutlet UIImageView *coverMiddleImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *recReasonLabel;
@property (weak, nonatomic) IBOutlet UIButton *playsCountsButton;
@property (weak, nonatomic) IBOutlet UIButton *tracksButton;

@end

@implementation HSRecommendsCell


+ (instancetype)creatTableCellWithTableView:(UITableView *)tableView {
    
    static NSString *identifier = @"HSRecommendsCellid";
    
    HSRecommendsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        
        NSBundle *currentBundle = [NSBundle bundleForClass:self];
        cell = [[currentBundle loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
        
        //cell = [[<#Class#> alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    
    //[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

-(void)setRecommends:(HSRecommends *)recommends{
    _recommends = recommends;
    
    [self.coverMiddleImageView setURLImageWithURL:[NSURL URLWithString:recommends.coverMiddle] placeHoldImage:[UIImage imageNamed:@"find_albumcell_cover_bg"] isCircle:NO];
    self.titleLabel.text = recommends.title;
    self.recReasonLabel.text = recommends.recReason;
    [self.playsCountsButton setTitle:recommends.playsCounts forState:UIControlStateNormal];
    [self.tracksButton setTitle:recommends.tracks forState:UIControlStateNormal];
    
    //[self.titleLabel sizeToFit];
    //[self.recReasonLabel sizeToFit];
    //recommends.cellHeight = self.titleLabel.height + self.recReasonLabel.height + 56;
    
}



@end
