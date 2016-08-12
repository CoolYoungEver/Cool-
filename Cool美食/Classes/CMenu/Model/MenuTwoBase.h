//
//  MenuTwoBase.h
//  Cool美食
//
//  Created by qingyun on 16/8/4.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TwoAuthor.h"

@interface MenuTwoBase : NSObject

@property (nonatomic, copy) NSString *strONEName;
@property (nonatomic, copy) NSString *strONEScore;
@property (nonatomic, strong) TwoAuthor *strONEAUthor;
@property (nonatomic, copy) NSString *strONEPhoto;

+ (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
