//
//  endBase.m
//  Cool美食
//
//  Created by qingyun on 16/8/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "endBase.h"

@implementation endBase

+ (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (dict == nil || [dict isKindOfClass:[NSNull class]])  return nil;
    endBase *endCai = [self new];
    endCai.strEnmenuName = dict[@"menuName"];
    endCai.strEnmenuPic = dict[@"menuPic"];
    endCai.strEnmenuAuthorName = dict[@"menuAuthorName"];
    endCai.strEnmenuAuthorIcon = dict[@"menuAuthorIcon"];
    endCai.strEnmenuCooker = dict[@"menuCooker"];
    endCai.strEnmenuDate = dict[@"menuDate"];
    endCai.strEnmenuState = dict[@"menuState"];
    endCai.strEnmenuTips = dict[@"menuTips"];
    endCai.strEnmenuCookerName = dict[@"menuCookerName"];
    NSArray *arrTemp = dict[@"menuMaterial"];
    for (NSInteger index = 0; index < arrTemp.count; index ++) {
        NSDictionary *dictTemp = arrTemp[index];
        endMenuMaterial *model = [endMenuMaterial initWithDictionary:dictTemp];
        [endCai.arrEnmenuMaterial addObject:model];
    }
    
    
    return endCai;
}

- (id)init {
    if (self = [super init]) {
        self.arrEnmenuMaterial = [NSMutableArray array];
    }
    return self;
}

@end
