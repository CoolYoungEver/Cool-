//
//  MoreHealthTableViewCell.h
//  Cool美食
//
//  Created by qingyun on 16/8/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoolMoreHealthMassage.h"

@interface MoreHealthTableViewCell : UITableViewCell

@property (nonatomic, strong) CoolMoreHealthMassage *model;
@property (weak, nonatomic) IBOutlet UIImageView *imagePag;
@property (weak, nonatomic) IBOutlet UILabel *labTitle;
@property (weak, nonatomic) IBOutlet UILabel *labTips;

+ (instancetype)initWithTableView:(UITableView *)tableView;

@end
