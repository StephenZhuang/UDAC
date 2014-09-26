//
//  ApiDoLogin
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "ApiDoLogin.h"

@implementation ApiDoLogin


	/**
	 * 登录-传入参数(UserInfo)
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param usercode  用户名
	 * @param userpwd  密码
	 * @param class  分类 default com.shqj.webservice.entity.UserInfo
	 * @callback Login
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  usercode:(NSString*)usercode userpwd:(NSString*)userpwd class:(NSString*)class {
		NSMutableArray *array=[[NSMutableArray alloc]initWithObjects:nil];
		[array addObject:[NSString stringWithFormat:@"usercode=%@",usercode==nil?@"":usercode]];
		[array addObject:[NSString stringWithFormat:@"userpwd=%@",userpwd==nil?@"":userpwd]];
		[array addObject:[NSString stringWithFormat:@"class=%@",class==nil?@"com.shqj.webservice.entity.UserInfo":class==nil?@"":class]];
		UpdateOne *updateone=[[Updateone2Json alloc] init:@"DoLogin" params:array  delegate:delegate selecter:select];
		return [self instanceUpdate:updateone];
	}

	/**
	 * 登录-传入参数(UserInfo)
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param usercode  用户名
	 * @param userpwd  密码
	 * @param class  分类 default com.shqj.webservice.entity.UserInfo
	 * @callback Login
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  usercode:(NSString*)usercode userpwd:(NSString*)userpwd class:(NSString*)class {
		UpdateOne *update=[self get:delegate selecter:select usercode:usercode userpwd:userpwd class:class];
		[DataManager loadData:[[NSArray alloc]initWithObjects:update,nil] delegate:delegate];
		return update;
	}


@end
