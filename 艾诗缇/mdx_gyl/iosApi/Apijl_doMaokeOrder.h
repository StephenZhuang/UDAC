//
//  Apijl_doMaokeOrder
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "ApiUpdate.h"


@interface Apijl_doMaokeOrder : ApiUpdate


	/**
	 * 2.4	门店确认兑换单 jlorder
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @callback MakeJFOrder_Builder
	 * @param class  分类 default com.shqj.webservice.entity.JLDHOrder
	 * @param dcount  要兑换的奖励金额
	 * @param pk_key  当前门店KEY
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  class:(NSString*)class dcount:(NSString*)dcount pk_key:(NSString*)pk_key;
	/**
	 * 2.4	门店确认兑换单 jlorder
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param class  分类 default com.shqj.webservice.entity.JLDHOrder
	 * @param dcount  要兑换的奖励金额
	 * @param pk_key  当前门店KEY
	 * @callback MakeJFOrder_Builder
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  class:(NSString*)class dcount:(NSString*)dcount pk_key:(NSString*)pk_key;

@end
