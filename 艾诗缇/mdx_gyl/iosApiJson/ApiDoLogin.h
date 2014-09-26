//
//  ApiDoLogin
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "ApiUpdate.h"


@interface ApiDoLogin : ApiUpdate


	/**
	 * 登录-传入参数(UserInfo)
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @callback Login
	 * @param usercode  用户名
	 * @param userpwd  密码
	 * @param class  分类 default com.shqj.webservice.entity.UserInfo
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  usercode:(NSString*)usercode userpwd:(NSString*)userpwd class:(NSString*)class;
	/**
	 * 登录-传入参数(UserInfo)
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param usercode  用户名
	 * @param userpwd  密码
	 * @param class  分类 default com.shqj.webservice.entity.UserInfo
	 * @callback Login
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  usercode:(NSString*)usercode userpwd:(NSString*)userpwd class:(NSString*)class;

@end
