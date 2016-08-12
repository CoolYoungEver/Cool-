//
//  LoadXib.m
//  Cool美食
//
//  Created by qingyun on 16/8/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LoadXib.h"
#import "CellItemsModel.h"
#import "CoolMenuTopArray.h"
#import "UIImageView+WebCache.h"


@implementation LoadXib

+ (instancetype)loadXib:(CGRect)frame{
    LoadXib *xib = [[[NSBundle mainBundle] loadNibNamed:@"LoadXib" owner:nil options:nil] firstObject];
    xib.frame = frame;
    return xib;
}

- (void)setModel:(CoolMenuHeaderEvens *)model {
    _model = model;
    CoolMenuTopArray *dModel = _model.dishes.arrDis[arc4random_uniform(5)];
    self.labCC.text = model.strHeadName;
    self.labCount.text = [NSString stringWithFormat:@"%ld 作品",(long)model.intNdishes];
    NSURL *url = [NSURL URLWithString:dModel.strThumbnail_280];
    [_imageCC sd_setImageWithURL:url];
}

@end
