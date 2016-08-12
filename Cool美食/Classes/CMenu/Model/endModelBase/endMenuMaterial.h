//
//  endMenuMaterial.h
//  Cool美食
//
//  Created by qingyun on 16/8/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface endMenuMaterial : NSObject

@property (nonatomic, copy) NSString *strMaterialName;
@property (nonatomic, copy) NSString *strMaterialWeight;

+ (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
