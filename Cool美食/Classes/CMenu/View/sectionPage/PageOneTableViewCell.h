//
//  PageOneTableViewCell.h
//  Cool美食
//
//  Created by qingyun on 16/8/13.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSMenuStepModel.h"

@interface PageOneTableViewCell : UITableViewCell
@property (nonatomic, strong) YSMenuStepModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *labtitle;
@property (nonatomic, assign) NSInteger index;
+ (instancetype)initWithTableView:(UITableView *)tableView;

@end
