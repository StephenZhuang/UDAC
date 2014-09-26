//
//  Apijl_doQueryMyjlOrder
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "ApiUpdate.h"


@interface Apijl_doQueryMyjlOrder : ApiUpdate


	/**
	 * 2.4	门店确认兑换单 userkey
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @callback QueryAllMyJLOrder
	 * @param class  分类 default com.shqj.webservice.entity.UserKey
	 * @param key  当前门店KEY
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  class:(NSString*)class key:(NSString*)key;
	/**
	 * 2.4	门店确认兑换单 userkey
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param class  分类 default com.shqj.webservice.entity.UserKey
	 * @param key  当前门店KEY
	 * @callback QueryAllMyJLOrder
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  class:(NSString*)class key:(NSString*)key;

@end
