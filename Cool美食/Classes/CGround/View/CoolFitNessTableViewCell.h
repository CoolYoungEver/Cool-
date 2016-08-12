//
//  CoolFitNessTableViewCell.h
//  Cool美食
//
//  Created by qingyun on 16/8/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoolJianFitness.h"

@interface CoolFitNessTableViewCell : UITableViewCell
@property (nonatomic, strong) CoolJianFitness *model;
@property (weak, nonatomic) IBOutlet UIImageView *imagePag;
@property (weak, nonatomic) IBOutlet UILabel *labTitle;
@property (weak, nonatomic) IBOutlet UILabel *labTips;

+ (instancetype)initWithTableView:(UITableView *)tableView;

@end
