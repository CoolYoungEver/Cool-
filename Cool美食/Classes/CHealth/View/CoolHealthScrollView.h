//
//  CoolHealthScrollView.h
//  Cool美食
//
//  Created by qingyun on 16/8/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoolHealthScrollView : UIScrollView

@property (nonatomic, copy) NSArray *arrTitles;
@property (nonatomic, copy) void(^blkChooseAction)(NSInteger index);
@property (nonatomic, assign) NSInteger countIndex;
@property (nonatomic, strong) NSMutableArray *arrButtons;

- (void)chooseAtIndex:(NSInteger)index;


@end
