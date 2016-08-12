//
//  TwoAuthor.h
//  Cool美食
//
//  Created by qingyun on 16/8/4.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TwoAuthor : NSObject
@property (nonatomic, copy) NSString *strAUName;
@property (nonatomic, copy) NSString *strAUPhoto;

+ (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
