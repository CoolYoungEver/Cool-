//
//  CellIssuesModel.m
//  Cool美食
//
//  Created by qingyun on 16/8/2.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CellItemsModel.h"


@implementation CellItemsModel

+ (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (dict == nil || [dict isKindOfClass:[NSNull class]]) return nil;
    CellItemsModel *items = [self new];
    items.strID = dict[@"id"];
    items.strPic = dict[@"pic"];
    items.strType = dict[@"type"];
    items.strTitle = dict[@"title"];
    items.strSeeNum = dict[@"seeNum"];
    items.strUserIcon = dict[@"userIcon"];
    
    return items;
}





@end
