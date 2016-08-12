//
//  CoolMenuThirdTableViewCell.h
//  Cool美食
//
//  Created by qingyun on 16/8/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellItemsModel.h"

@interface CoolMenuThirdTableViewCell : UITableViewCell

- (instancetype)initWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) CellItemsModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *imagePhoto;
@property (weak, nonatomic) IBOutlet UIImageView *imageHead;
@property (weak, nonatomic) IBOutlet UILabel *labTitle;
@property (weak, nonatomic) IBOutlet UILabel *labCount;

@end
