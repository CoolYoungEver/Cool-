//
//  SectioniiTableViewCell.h
//  Cool美食
//
//  Created by qingyun on 16/8/13.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSMenuDataModel.h"

@interface SectioniiTableViewCell : UITableViewCell
@property (nonatomic, strong) YSMenuDataModel *model;
@property (weak, nonatomic) IBOutlet UILabel *labStats;
+ (instancetype)initWithTableView:(UITableView *)tableView;

@end
