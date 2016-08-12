//
//  CoolMenuHeaderView.h
//  Cool美食
//
//  Created by qingyun on 16/8/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

//@class CoolMenuHeaderView;
//@protocol CoolMenuHeaderViewDelegate <NSObject>
//
//@optional
//- (void)headerView:(CoolMenuHeaderView *)headerView didSelectButtonWithData:(NSString *)currentIndex;
//
//- (void)headerView:(CoolMenuHeaderView *)headerView didTapImageViewAtIndex:(NSUInteger)index;
//
//
//@end


@interface CoolMenuHeaderView : UITableViewHeaderFooterView
{
    UIScrollView *topScroll;
    UIPageControl *pageCon;
}
//@property (nonatomic, weak) id<CoolMenuHeaderViewDelegate> delegate;
@property (nonatomic, copy) NSArray *arrData;
@property (nonatomic, assign) NSInteger indexCurrent;
@property (nonatomic, copy) void (^blaTag)(NSInteger);

- (id)init;
-(void) updateScrollView:(NSArray *) arrModel;



@end
