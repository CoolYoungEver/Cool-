//
//  CoolMoreHealthMassage.h
//  Cool美食
//
//  Created by qingyun on 16/8/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoolMoreHealthMassage : NSObject
@property (nonatomic, copy) NSString *strTitle;
@property (nonatomic, copy) NSString *strCover;
@property (nonatomic, copy) NSString *strDigest;
@property (nonatomic, copy) NSString *strLink;


+ (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
