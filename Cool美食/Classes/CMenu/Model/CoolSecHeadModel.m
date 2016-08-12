//
//  CoolSecHeadModel.m
//  Cool美食
//
//  Created by qingyun on 16/8/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CoolSecHeadModel.h"

@implementation CoolSecHeadModel

+ (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (dict == nil || [dict isKindOfClass:[NSNull class]]) return nil;
    CoolSecHeadModel *mo = [self new];
    mo.strZaoCollectNum = dict[@"collectNum"];
    mo.strZaoMakeNum = dict[@"makeNum"];
    mo.strZaoMenuMaterial = dict[@"menuMaterial"];
    mo.strZaoMenuPic = dict[@"menuPic"];
    mo.strZaoMenuTitle = dict[@"menuTitle"];
    mo.strZaoUserName = dict[@"userName"];
    mo.strZaoMenuId = dict[@"menuId"];
    
    return mo;
}

@end
