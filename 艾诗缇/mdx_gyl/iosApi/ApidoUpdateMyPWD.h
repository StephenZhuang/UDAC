//
//  ApidoUpdateMyPWD
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "ApiUpdate.h"


@interface ApidoUpdateMyPWD : ApiUpdate


	/**
	 * 2.5	读取总数 userkeypwd
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @callback MakeJFOrder_Builder
	 * @param class  分类 default com.shqj.webservice.entity.UserKeyPwd
	 * @param key  当前门店KEY
	 * @param pwd  当前门店KEY
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  class:(NSString*)class key:(NSString*)key pwd:(NSString*)pwd;
	/**
	 * 2.5	读取总数 userkeypwd
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param class  分类 default com.shqj.webservice.entity.UserKeyPwd
	 * @param key  当前门店KEY
	 * @param pwd  当前门店KEY
	 * @callback MakeJFOrder_Builder
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  class:(NSString*)class key:(NSString*)key pwd:(NSString*)pwd;

@end
