//
//  CellIssuesModel.h
//  Cool美食
//
//  Created by qingyun on 16/8/2.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CellItemsModel : NSObject

@property (nonatomic, copy) NSString *strType;
@property (nonatomic, copy) NSString *strPic;
@property (nonatomic, copy) NSString *strUserIcon;
@property (nonatomic, copy) NSString *strTitle;
@property (nonatomic, copy) NSString *strSeeNum;
@property (nonatomic, copy) NSString *strID;

+ (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
