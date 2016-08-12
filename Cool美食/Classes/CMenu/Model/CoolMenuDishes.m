//
//  CoolMenuDishes.m
//  Cool美食
//
//  Created by qingyun on 16/8/4.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolMenuDishes.h"

@implementation CoolMenuDishes

+ (instancetype)initWithDictionay:(NSDictionary *)dict {
    if (dict == nil || [dict isKindOfClass:[NSNull class]]) return nil;
    CoolMenuDishes *MDis = [self new];
    NSArray *arr = dict[@"dishes"];
    for (NSInteger index = 0; index < arr.count; index ++) {
        NSDictionary *dict = arr[index];
        CoolMenuTopArray *dModel = [CoolMenuTopArray initWithDictionary:dict];
        [MDis.arrDis addObject:dModel];
    }
    return MDis;
}

- (id)init {
    if (self = [super init]) {
        self.arrDis = [NSMutableArray array];
    }
    return self;
}

@end
