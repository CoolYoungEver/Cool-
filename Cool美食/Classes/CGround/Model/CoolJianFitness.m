//
//  CoolJianFitness.m
//  Cool美食
//
//  Created by qingyun on 16/8/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolJianFitness.h"

@implementation CoolJianFitness

+ (instancetype)initWithDIctionary:(NSDictionary *)dict {
    if (dict == nil || [dict isKindOfClass:[NSNull class]]) return nil;
    CoolJianFitness *jian = [self new];
    jian.strFitLink = dict[@"link"];
    jian.strFitCover = dict[@"cover"];
    jian.strFitTitle = dict[@"title"];
    jian.strFitDigest = dict[@"digest"];
    return jian;
    
}



@end
