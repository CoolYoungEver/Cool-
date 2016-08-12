//
//  CoolMenuTopArray.m
//  Cool美食
//
//  Created by qingyun on 16/8/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolMenuTopArray.h"

@implementation CoolMenuTopArray

+ (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (dict == nil || [dict isKindOfClass:[NSNull class]]) return nil;
    CoolMenuTopArray *topA = [self new];
    topA.strThumbnail_280 = dict[@"thumbnail_280"];
    return topA;
}

@end
