//
//  CoolMenuTableViewCell.m
//  Cool美食
//
//  Created by qingyun on 16/8/1.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolMenuTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation CoolMenuTableViewCell

- (instancetype)initWithTableView:(UITableView *)tableView {
    
    static NSString *identifier = @"firstCell";
    CoolMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CoolMenuTableViewCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)setModel:(CellItemsModel *)model {
    _model = model;
    NSURL *urlPhoto = [NSURL URLWithString:model.strPic];
    [_imagePhoto sd_setImageWithURL:urlPhoto];
    NSURL *urlHead = [NSURL URLWithString:model.strUserIcon];
    [_imageHead sd_setImageWithURL:urlHead];
    _imageHead.layer.cornerRadius = 25;
    _imageHead.layer.masksToBounds = YES;
    _labTitle.text = model.strTitle;
    _labCount.text = [NSString stringWithFormat:@"%@人浏览过",model.strSeeNum];
    
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
