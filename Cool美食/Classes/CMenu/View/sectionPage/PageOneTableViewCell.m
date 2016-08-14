//
//  PageOneTableViewCell.m
//  Cool美食
//
//  Created by qingyun on 16/8/13.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "PageOneTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation PageOneTableViewCell

+ (instancetype)initWithTableView:(UITableView *)tableView {
    static NSString *strID = @"SepsCell";
    PageOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strID];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"PageOneTableViewCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)setModel:(YSMenuStepModel *)model {
    _model = model;
//    _labtitle.text = model.stepState;
    NSURL *url = [NSURL URLWithString:model.stepPic];
    [_image sd_setImageWithURL:url];
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
