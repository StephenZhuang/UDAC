//
//  Apijf_doQueryAllMyOrder
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "ApiUpdate.h"


@interface Apijf_doQueryAllMyOrder : ApiUpdate


	/**
	 * 1.3	查询我的订单 userkey
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @callback QueryAllMyOrderList
	 * @param class  分类 default com.shqj.webservice.entity.UserKey
	 * @param key  当前门店KEY
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  class:(NSString*)class key:(NSString*)key;
	/**
	 * 1.3	查询我的订单 userkey
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param class  分类 default com.shqj.webservice.entity.UserKey
	 * @param key  当前门店KEY
	 * @callback QueryAllMyOrderList
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  class:(NSString*)class key:(NSString*)key;

@end
