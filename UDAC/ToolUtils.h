//
//  ToolUtils.h
//  UDAC
//
//  Created by Stephen Zhuang on 14-8-13.
//  Copyright (c) 2014年 udows. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToolUtils : NSObject
@property (nonatomic , assign) BOOL isLogin;
@property (nonatomic , copy) NSString *username;
@property (nonatomic , copy) NSString *password;
@property (nonatomic , strong) Login *user;

+ (instancetype) sharedInstance;
@end
