//
//  Apijl_doDeleteMyOrder
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "ApiUpdate.h"


@interface Apijl_doDeleteMyOrder : ApiUpdate


	/**
	 * 2.5	删除奖励兑换单接口 userandcode
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @callback MakeJFOrder
	 * @param class  分类 default com.shqj.webservice.entity.UserKeyAndOrderCode
	 * @param key  当前门店KEY
	 * @param billcode  订单号
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  class:(NSString*)class key:(NSString*)key billcode:(NSString*)billcode;
	/**
	 * 2.5	删除奖励兑换单接口 userandcode
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param class  分类 default com.shqj.webservice.entity.UserKeyAndOrderCode
	 * @param key  当前门店KEY
	 * @param billcode  订单号
	 * @callback MakeJFOrder
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  class:(NSString*)class key:(NSString*)key billcode:(NSString*)billcode;

@end
