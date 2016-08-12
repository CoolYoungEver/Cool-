//
//  MoreHealthTableViewCell.m
//  Cool美食
//
//  Created by qingyun on 16/8/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "MoreHealthTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation MoreHealthTableViewCell

+ (instancetype)initWithTableView:(UITableView *)tableView {
    static NSString *strindentifier = @"cellMore";
    MoreHealthTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strindentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MoreHealthTableViewCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)setModel:(CoolMoreHealthMassage *)model {
    _model = model;
    NSURL *url = [NSURL URLWithString:model.strCover];
    [_imagePag sd_setImageWithURL:url];
    _labTitle.text = model.strTitle;
    _labTips.text = model.strDigest;
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
