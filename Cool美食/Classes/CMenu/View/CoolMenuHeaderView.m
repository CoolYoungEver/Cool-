//
//  CoolMenuHeaderView.m
//  Cool美食
//
//  Created by qingyun on 16/8/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolMenuHeaderView.h"
#import "Masonry.h"
#import "LoadXib.h"

#import "UIImageView+WebCache.h"

@implementation CoolMenuHeaderView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self == [super initWithCoder:aDecoder]) {
        [self loadDefaultSetting];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self loadDefaultSetting];
    }
    return self;
}

- (void)loadDefaultSetting {
 
    topScroll = [[UIScrollView alloc] init];
    topScroll.pagingEnabled = YES;
    [self addSubview:topScroll];
    [topScroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.trailing.leading.mas_equalTo(self);
        make.height.mas_equalTo(90);
    }];
  
    [self updateScrollView:_arrData];
}
//刷新滑动视图
-(void) updateScrollView:(NSArray *) arrModel{
    if (arrModel.count==0) {
        return;
    }
    _arrData = arrModel;
    CGFloat topScWidth = self.frame.size.width;
    NSInteger count = arrModel.count;
    for (NSInteger index = 0; index < count; index ++) {
        LoadXib *topView = [LoadXib loadXib:CGRectMake(index * topScWidth, 0, topScWidth, 90)];
        UIButton *btu = [UIButton buttonWithType:UIButtonTypeCustom];
        btu.frame = CGRectMake(index * topScWidth, 0, topScWidth, 90);
        topView.model = arrModel[index];
        btu.tag = index + 1;
        [topScroll addSubview:topView];
        [topScroll addSubview:btu];
        [btu addTarget:self action:@selector(chooseIndex:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    topScroll.contentSize = CGSizeMake(count * topScWidth, 0);
    
    pageCon = [UIPageControl new];
    [self addSubview:pageCon];
    pageCon.numberOfPages = arrModel.count;
    pageCon.pageIndicatorTintColor = [UIColor grayColor];
    pageCon.currentPageIndicatorTintColor = [UIColor orangeColor];
    [pageCon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self);
        make.height.mas_equalTo(20);
        make.bottom.mas_equalTo(self);
    }];
    
    [NSTimer scheduledTimerWithTimeInterval:15 target:self selector:@selector(change) userInfo:nil repeats:YES];
    
}

- (id)init {
    if (self = [super init]) {
        self.arrData = [NSArray array];
    }
    return self;
}

- (void)chooseIndex:(UIButton *)button{
    if (self.blaTag) {
        self.blaTag(button.tag);
    }

}

- (void)change {
    if (_indexCurrent > (_arrData.count - 1)) {
        _indexCurrent = 0;
    }
    pageCon.currentPage = _indexCurrent;
    [topScroll setContentOffset:CGPointMake(topScroll.frame.size.width * _indexCurrent, 0) animated:YES];
    _indexCurrent += 1;
    
    
}



@end
