//
//  CoolMenuDishes.h
//  Cool美食
//
//  Created by qingyun on 16/8/4.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoolMenuTopArray.h"

@interface CoolMenuDishes : NSObject
- (id)init;
+ (instancetype)initWithDictionay:(NSDictionary *)dict;
@property (nonatomic, strong) NSMutableArray *arrDis;


@end
