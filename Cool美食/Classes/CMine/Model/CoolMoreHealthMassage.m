//
//  CoolMoreHealthMassage.m
//  Cool美食
//
//  Created by qingyun on 16/8/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolMoreHealthMassage.h"

@implementation CoolMoreHealthMassage

+ (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (dict == nil || [dict isKindOfClass:[NSNull class]]) return nil;
    CoolMoreHealthMassage *more = [self new];
    more.strCover = dict[@"cover"];
    more.strTitle = dict[@"title"];
    more.strDigest = dict[@"digest"];
    more.strLink = dict[@"link"];
    return more;
}

@end
