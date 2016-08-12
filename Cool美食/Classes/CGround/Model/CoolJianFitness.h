//
//  CoolJianFitness.h
//  Cool美食
//
//  Created by qingyun on 16/8/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoolJianFitness : NSObject

@property (nonatomic, copy) NSString *strFitTitle;
@property (nonatomic, copy) NSString *strFitCover;
@property (nonatomic, copy) NSString *strFitLink;
@property (nonatomic, copy) NSString *strFitDigest;

+ (instancetype)initWithDIctionary:(NSDictionary *)dict;
@end
