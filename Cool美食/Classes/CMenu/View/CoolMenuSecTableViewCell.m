//
//  CoolMenuSecTableViewCell.m
//  Cool美食
//
//  Created by qingyun on 16/8/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolMenuSecTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation CoolMenuSecTableViewCell

- (instancetype)initWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"sectionCell";
    CoolMenuSecTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CoolMenuSecTableViewCell" owner:nil options:nil] firstObject];
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
