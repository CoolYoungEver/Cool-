//
//  SectioniiTableViewCell.m
//  Cool美食
//
//  Created by qingyun on 16/8/13.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "SectioniiTableViewCell.h"

@implementation SectioniiTableViewCell

+ (instancetype)initWithTableView:(UITableView *)tableView {
    static NSString *strID = @"StateCell";
    SectioniiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strID];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"SectioniiTableViewCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)setModel:(YSMenuDataModel *)model {
    _model = model;
    _labStats.text = model.menuState;
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
