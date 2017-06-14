//
//  HSSegmentBar.m
//  FunkySegmentBar
//
//  Created by 胡晟 on 2017/6/12.
//  Copyright © 2017年 funkyHS. All rights reserved.
//

#import "HSSegmentBar.h"
#import "UIView+HSLayout.h"


#define kMinMargin 30

@interface HSSegmentBar ()
{
    // 记录最后一次点击的按钮
    UIButton *_lastBtn;
}
/** 内容承载视图 */
@property (nonatomic, weak) UIScrollView *contentView;

/** 添加的按钮数据 */
@property (nonatomic, strong) NSMutableArray <UIButton *>*itemBtns;

/** 指示器 */
@property (nonatomic, weak) UIView *indicatorView;

@property (nonatomic, strong) HSSegmentBarConfig *config;

@end

@implementation HSSegmentBar



#pragma mark - UI视图
// 快速创建选项卡控件
+ (instancetype)segmentBarWithFrame: (CGRect)frame {
    
    HSSegmentBar *segmentBar = [[HSSegmentBar alloc] initWithFrame:frame];
    
    // 添加内容承载视图
    return segmentBar;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = self.config.segmentBarBackColor;
    }
    return self;
}

//- (void)setFrame:(CGRect)frame {
//    [super setFrame:CGRectMake(0, 0, self.superview.bounds.size.width, self.superview.bounds.size.height)];
//}

// 更改选项卡的样式
- (void)updateWithConfig: (void(^)(HSSegmentBarConfig *config))configBlock {
    
    if (configBlock) {
        configBlock(self.config);
    }
    
    // 按照当前的 self.config 进行刷新
    self.backgroundColor = self.config.segmentBarBackColor;
    
    for (UIButton *btn in self.itemBtns) {
        [btn setTitleColor:self.config.itemNormalColor forState:UIControlStateNormal];
        [btn setTitleColor:self.config.itemSelectColor forState:UIControlStateSelected];
        btn.titleLabel.font = self.config.itemFont;
    }
    
    // 指示器
    self.indicatorView.backgroundColor = self.config.indicatorColor;
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    
}


- (void)setSelectIndex:(NSInteger)selectIndex {
    // 数据过滤
    if (self.itemBtns.count == 0 || selectIndex < 0 || selectIndex > self.itemBtns.count - 1) {
        return;
    }
    _selectIndex = selectIndex;
    UIButton *btn = self.itemBtns[selectIndex];
    [self btnClick:btn];
}

// 根据外界设置的数据源，动态创建并加载bar视图
- (void)setItems:(NSArray<NSString *> *)items {
    _items = items;
    
    // 删除之前添加过多额组件
    [self.itemBtns makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.itemBtns = nil;
    
    
    // 根据所有的选项数据源， 创建Button, 添加到内容视图
    for (NSString *item in items) {
        UIButton *btn = [[UIButton alloc] init];
        btn.tag = self.itemBtns.count;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        [btn setTitleColor:self.config.itemNormalColor forState:UIControlStateNormal];
        [btn setTitleColor:self.config.itemSelectColor forState:UIControlStateSelected];
        btn.titleLabel.font = self.config.itemFont;
        [btn setTitle:item forState:UIControlStateNormal];
        [self.contentView addSubview:btn];
        [self.itemBtns addObject:btn];
    }
    
    // 手动刷新布局
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
}


#pragma mark - 私有方法
- (void)btnClick: (UIButton *)btn {
    
    if ([self.delegate respondsToSelector:@selector(segmentBar:didSelectIndex:fromIndex:)]) {
        [self.delegate segmentBar:self didSelectIndex:btn.tag fromIndex:_lastBtn.tag];
    }
    
    _selectIndex = btn.tag;
    
    _lastBtn.selected = NO;
    btn.selected = YES;
    _lastBtn = btn;
    
    [UIView animateWithDuration:0.1 animations:^{
        self.indicatorView.width = btn.width + self.config.indicatorExtraW * 2;
        self.indicatorView.centerX = btn.centerX;
    }];
    
    
    // 1. 县滚动到btn的位置
    
    CGFloat scrollX = btn.centerX - self.contentView.width * 0.5;
    
    if (scrollX < 0) {
        scrollX = 0;
    }
    if (scrollX > self.contentView.contentSize.width - self.contentView.width) {
        scrollX = self.contentView.contentSize.width - self.contentView.width;
    }
    
    [self.contentView setContentOffset:CGPointMake(scrollX, 0) animated:YES];
    
}

#pragma mark - 布局
- (void)layoutSubviews {
    [super layoutSubviews];
    self.contentView.frame = self.bounds;
    
    
    CGFloat totalBtnWidth = 0;// 所有按钮的宽度总和
    CGFloat lastX = 0; // 记录按钮与间隙的总长度

    
    if (self.config.barBtnW != 0) {
        // 外界规定了按钮的宽度
        
        for (UIButton *btn in self.itemBtns) {
            
            [btn sizeToFit];
            btn.width = self.config.barBtnW;
            
            btn.y = 0;
            btn.x = lastX;
            lastX += btn.width;
        }
        
        
    }else{
        // 按钮的宽度根据title自适应
        
        for (UIButton *btn in self.itemBtns) {
            [btn sizeToFit];
            totalBtnWidth += btn.width;
        }
        
        // 计算margin
        CGFloat caculateMargin = (self.width - totalBtnWidth) / (self.items.count + 1);
        if (caculateMargin < kMinMargin) {
            caculateMargin = kMinMargin;
        }
        
        lastX = caculateMargin;
        
        for (UIButton *btn in self.itemBtns) {
            // w, h
            [btn sizeToFit];
            // y 0
            // x, y,
            btn.y = 0;
            
            btn.x = lastX;
            
            lastX += btn.width + caculateMargin;
            
        }
    }
    

    
    self.contentView.contentSize = CGSizeMake(lastX, 0);
    
    if (self.itemBtns.count == 0) {
        return;
    }
    UIButton *btn = self.itemBtns[self.selectIndex];
    self.indicatorView.width = btn.width + self.config.indicatorExtraW * 2;
    self.indicatorView.centerX = btn.centerX;
    self.indicatorView.height = self.config.indicatorHeight;
    self.indicatorView.y = self.height - self.indicatorView.height;
}

#pragma mark - 懒加载

- (NSMutableArray<UIButton *> *)itemBtns {
    if (!_itemBtns) {
        _itemBtns = [NSMutableArray array];
    }
    return _itemBtns;
}
- (UIView *)indicatorView {
    if (!_indicatorView) {
        CGFloat indicatorH = self.config.indicatorHeight;
        UIView *indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height - indicatorH, 0, indicatorH)];
        indicatorView.backgroundColor = self.config.indicatorColor;
        [self.contentView addSubview:indicatorView];
        _indicatorView = indicatorView;
    }
    return _indicatorView;
}

- (UIScrollView *)contentView {
    if (!_contentView) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.showsHorizontalScrollIndicator = NO;
        //scrollView.backgroundColor = [UIColor blueColor];
        [self addSubview:scrollView];
        _contentView = scrollView;
    }
    return _contentView;
}
// 选项卡的配置项
- (HSSegmentBarConfig *)config {
    if (!_config) {
        _config = [HSSegmentBarConfig defaultConfig];
    }
    return _config;
}


@end
