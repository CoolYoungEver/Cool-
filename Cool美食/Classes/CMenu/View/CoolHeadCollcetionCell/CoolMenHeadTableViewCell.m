//
//  CoolMenHeadTableViewCell.m
//  Cool美食
//
//  Created by qingyun on 16/8/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolMenHeadTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation CoolMenHeadTableViewCell

+ (instancetype)initWithDictionary:(UITableView *)tableView {
    static NSString *strIndentifier = @"cellType";
    CoolMenHeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strIndentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CoolMenHeadTableViewCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)setModel:(CoolSecHeadModel *)model {
    _model = model;
    _strZan.text = [NSString stringWithFormat:@"%@⭐️",model.strZaoCollectNum];
    _strCount.text = [NSString stringWithFormat:@"%@人做过",model.strZaoMakeNum];
    _strTitle.text = model.strZaoMenuTitle;
    _labZhong.text = model.strZaoMenuMaterial;
    _userName.text = model.strZaoUserName;
    NSURL *url = [NSURL URLWithString:model.strZaoMenuPic];
    [_imageIcon sd_setImageWithURL:url];
    
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
