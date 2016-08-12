//
//  CoolMenuTableViewCell.h
//  Cool美食
//
//  Created by qingyun on 16/8/1.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellItemsModel.h"


@interface CoolMenuTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imagePhoto;
@property (weak, nonatomic) IBOutlet UIImageView *imageHead;
@property (weak, nonatomic) IBOutlet UILabel *labTitle;
@property (weak, nonatomic) IBOutlet UILabel *labCount;

- (instancetype)initWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) CellItemsModel *model;


@end
