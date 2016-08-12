//
//  CoolMenuHeaderEvens.h
//  Cool美食
//
//  Created by qingyun on 16/8/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoolMenuDishes.h"

@interface CoolMenuHeaderEvens : NSObject

@property (nonatomic, copy) NSString *strHeadName;
@property (nonatomic, assign) NSInteger intNdishes;
@property (nonatomic, strong) CoolMenuDishes *dishes;

+ (instancetype)initWithDictionary:(NSDictionary *)dict;


@end
