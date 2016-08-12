//
//  LoadXib.h
//  Cool美食
//
//  Created by qingyun on 16/8/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoolMenuHeaderEvens.h"
#import "CoolMenuTopArray.h"
#import "CoolMenuDishes.h"

@interface LoadXib : UIView
+ (instancetype)loadXib:(CGRect)frame;
@property (nonatomic, strong) CoolMenuHeaderEvens *model;
@property (nonatomic, strong) CoolMenuTopArray *Dmodel;
@property (nonatomic, strong) CoolMenuDishes *Dismodel;

@property (weak, nonatomic) IBOutlet UIImageView *imageCC;

@property (weak, nonatomic) IBOutlet UILabel *labCC;
@property (weak, nonatomic) IBOutlet UILabel *labCount;



@end
