//
//  CoolMenuHeaderEvens.m
//  Cool美食
//
//  Created by qingyun on 16/8/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolMenuHeaderEvens.h"
#import "CoolMenuDishes.h"

@implementation CoolMenuHeaderEvens

+ (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (dict == nil || [dict isKindOfClass:[NSNull class]]) return nil;
    CoolMenuHeaderEvens *disaH = [self new];
    disaH.strHeadName = dict[@"name"];
    disaH.intNdishes = [dict[@"n_dishes"] integerValue];
    disaH.dishes = [CoolMenuDishes initWithDictionay:dict[@"dishes"]];
    return disaH;
}

@end
