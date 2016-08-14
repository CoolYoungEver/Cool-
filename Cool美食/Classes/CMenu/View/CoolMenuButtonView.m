//
//  CoolMenuButtonView.m
//  Cool美食
//
//  Created by qingyun on 16/8/13.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolMenuButtonView.h"

@implementation CoolMenuButtonView

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
    NSInteger count = 4;
    CGFloat btnWidth = 60;
    CGFloat btnHeight = 80;
    CGFloat leftSpeace = 30;
    CGFloat SceenWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat Speace = (SceenWidth - leftSpeace * 2 - 3 * btnWidth)/2;
    for (NSInteger index = 0; index < count; index ++) {
        UIButton *btnFunction = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat X = leftSpeace + (index % 3) * (btnWidth + Speace);
        btnFunction.frame = CGRectMake(X, 0, btnWidth, btnHeight);
        btnFunction.backgroundColor = [UIColor purpleColor];
        [self addSubview:btnFunction];
        
    }
}


@end
