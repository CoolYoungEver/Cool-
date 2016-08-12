//
//  CoolHealthScrollView.m
//  Cool美食
//
//  Created by qingyun on 16/8/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolHealthScrollView.h"
#import "Masonry.h"

@implementation CoolHealthScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self loadUI];
    }
    return  self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self loadUI];
    }
    return  self;
}

- (void)loadUI {
    self.backgroundColor = [UIColor lightTextColor];
}

- (void)setArrTitles:(NSArray *)arrTitles {
    _arrTitles = [arrTitles copy];
    
    self.arrButtons = [NSMutableArray array];
    CGFloat itemWidth = 80;
    CGFloat itemHeight = self.bounds.size.height;
    self.showsHorizontalScrollIndicator = NO;
    NSInteger count = arrTitles.count;
    for (NSUInteger index = 0; index < count; index ++) {
        UIButton *btnItem = [UIButton buttonWithType:UIButtonTypeCustom];
        btnItem.frame =CGRectMake(index * itemWidth, 0, itemWidth, itemHeight);
        [btnItem setTitle:arrTitles[index] forState:UIControlStateNormal];
        btnItem.titleLabel.font = [UIFont systemFontOfSize:15];
        [btnItem setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btnItem setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        [btnItem addTarget:self action:@selector(chooseAction:) forControlEvents:UIControlEventTouchDown];
        btnItem.tag = index + 100;
        [self addSubview:btnItem];
        
        [self.arrButtons addObject:btnItem];
    }
    self.countIndex = 0;
    [self setContentSize:CGSizeMake(count * itemWidth, 1)];
}

- (void)chooseAction:(UIButton *)button {
    self.countIndex = button.tag - 100;
    [self scrollRectToVisible:button.frame animated:YES];
    
    if (self.blkChooseAction) {
        self.blkChooseAction(self.countIndex);
    }
}

- (void)setCountIndex:(NSInteger)countIndex {
    UIButton *currontBtn = self.arrButtons[_countIndex];
    currontBtn.selected = NO;
    UIButton *lastBtn = self.arrButtons[countIndex];
    lastBtn.selected = YES;
    _countIndex = countIndex;
    
}

- (void)chooseAtIndex:(NSInteger)indexChoosed {
    NSUInteger count = self.arrTitles.count;
    for (NSUInteger index = 0; index < count; index ++) {
        UIButton *btn = self.subviews[index];
        if ([btn isKindOfClass:[UIButton class]] && btn.tag == indexChoosed) {
            [self chooseAction:btn];
            break;
        }
    }
}








@end
