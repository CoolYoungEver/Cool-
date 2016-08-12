//
//  endBase.h
//  Cool美食
//
//  Created by qingyun on 16/8/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "endMenuMaterial.h"

@interface endBase : NSObject

+ (instancetype)initWithDictionary:(NSDictionary *)dict;

@property (nonatomic, copy) NSString *strEnmenuName;
@property (nonatomic, copy) NSString *strEnmenuPic;
@property (nonatomic, copy) NSString *strEnmenuAuthorName;
@property (nonatomic, copy) NSString *strEnmenuAuthorIcon;
@property (nonatomic, copy) NSString *strEnmenuCooker;
@property (nonatomic, copy) NSString *strEnmenuDate;
@property (nonatomic, copy) NSString *strEnmenuState;
@property (nonatomic, copy) NSString *strEnmenuTips;
@property (nonatomic, copy) NSString *strEnmenuCookerName;
@property (nonatomic, strong) NSMutableArray<endMenuMaterial *> *arrEnmenuMaterial;

- (id)init;

@end
