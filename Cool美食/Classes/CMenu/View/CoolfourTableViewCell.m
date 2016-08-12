//
//  CoolfourTableViewCell.m
//  Cool美食
//
//  Created by qingyun on 16/8/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolfourTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation CoolfourTableViewCell

- (instancetype)initWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"fourCell";
    CoolfourTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CoolfourTableViewCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)setModel:(CellItemsModel *)model {
    _model = model;
    NSURL *url = [NSURL URLWithString:@"http://img3.3lian.com/2013/c3/94/d/1.jpg"];
    [_imageI sd_setImageWithURL:url];
    _labText.text = @"欢迎客官！进入有更多资讯！！";
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
