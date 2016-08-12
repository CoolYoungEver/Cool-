//
//  CoolFitNessTableViewCell.m
//  Cool美食
//
//  Created by qingyun on 16/8/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolFitNessTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation CoolFitNessTableViewCell

+ (instancetype)initWithTableView:(UITableView *)tableView {
    static NSString *strindentifier = @"cellTable";
    CoolFitNessTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strindentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CoolFitNessTableViewCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)setModel:(CoolJianFitness *)model {
    _model = model;
    NSURL *url = [NSURL URLWithString:model.strFitCover];
    [_imagePag sd_setImageWithURL:url];
    _labTitle.text = model.strFitTitle;
    _labTips.text = model.strFitDigest;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
