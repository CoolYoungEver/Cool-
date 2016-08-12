//
//  TwoAuthor.m
//  Cool美食
//
//  Created by qingyun on 16/8/4.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "TwoAuthor.h"

@implementation TwoAuthor
+ (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (dict == nil || [dict isKindOfClass:[NSNull class]]) return nil;
    TwoAuthor *oneAU = [self new];
    oneAU.strAUName = dict[@"name"];
    oneAU.strAUPhoto = dict[@"photo"];
    return oneAU;
}

@end
