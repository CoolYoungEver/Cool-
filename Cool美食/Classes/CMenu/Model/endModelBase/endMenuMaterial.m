//
//  endMenuMaterial.m
//  Cool美食
//
//  Created by qingyun on 16/8/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "endMenuMaterial.h"

@implementation endMenuMaterial

+ (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (dict == nil || [dict isKindOfClass:[NSNull class]])  return nil;
    endMenuMaterial *zuoFa = [self new];
    zuoFa.strMaterialName = dict[@"materialName"];
    zuoFa.strMaterialWeight = dict[@"materialWeight"];
    
    return zuoFa;
}

@end
