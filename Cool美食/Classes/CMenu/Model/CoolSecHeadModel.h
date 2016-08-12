//
//  CoolSecHeadModel.h
//  Cool美食
//
//  Created by qingyun on 16/8/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoolSecHeadModel : NSObject

@property (nonatomic, copy) NSString *strZaoCollectNum;
@property (nonatomic, copy) NSString *strZaoMakeNum;
@property (nonatomic, copy) NSString *strZaoMenuMaterial;
@property (nonatomic, copy) NSString *strZaoMenuPic;
@property (nonatomic, copy) NSString *strZaoMenuTitle;
@property (nonatomic, copy) NSString *strZaoUserName;
@property (nonatomic, copy) NSString *strZaoMenuId;

+ (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
