//
//  CoolMenHeadTableViewCell.h
//  Cool美食
//
//  Created by qingyun on 16/8/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoolSecHeadModel.h"

@interface CoolMenHeadTableViewCell : UITableViewCell

@property (nonatomic, strong) CoolSecHeadModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *imageIcon;
@property (weak, nonatomic) IBOutlet UILabel *strTitle;
@property (weak, nonatomic) IBOutlet UILabel *labZhong;
@property (weak, nonatomic) IBOutlet UILabel *strCount;
@property (weak, nonatomic) IBOutlet UILabel *strZan;
@property (weak, nonatomic) IBOutlet UILabel *userName;

+ (instancetype)initWithDictionary:(UITableView *)tableView;


@end
