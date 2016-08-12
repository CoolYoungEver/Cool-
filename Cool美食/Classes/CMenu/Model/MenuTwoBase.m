//
//  MenuTwoBase.m
//  Cool美食
//
//  Created by qingyun on 16/8/4.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "MenuTwoBase.h"

@implementation MenuTwoBase
+ (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (dict == nil || [dict isKindOfClass:[NSNull class]]) return nil;
    MenuTwoBase *user = [self new];
    user.strONEName = dict[@"name"];
    user.strONEPhoto = dict[@"photo"];
    user.strONEScore = dict[@"score"];
    user.strONEAUthor = [TwoAuthor initWithDictionary:dict[@"author"]];
    return user;
}
@end
