//
//  CoolfourTableViewCell.h
//  Cool美食
//
//  Created by qingyun on 16/8/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellItemsModel.h"


@interface CoolfourTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageI;
@property (weak, nonatomic) IBOutlet UILabel *labText;

- (instancetype)initWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) CellItemsModel *model;

@end
