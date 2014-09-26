//
//  Apijf_doMakeJFOrder
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "ApiUpdate.h"


@interface Apijf_doMakeJFOrder : ApiUpdate


	/**
	 * 1.1	查询可以兑换商品
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @callback MakeJFOrder_Builder
	 * @param jforder  传递参数:[{"class":"com.shqj.webservice.entity.JFBackOrder","count":12,"pk_cpkey":"商品KEY","pk_key":"门店KEY”}]
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  jforder:(NSString*)jforder;
	/**
	 * 1.1	查询可以兑换商品
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param jforder  传递参数:[{"class":"com.shqj.webservice.entity.JFBackOrder","count":12,"pk_cpkey":"商品KEY","pk_key":"门店KEY”}]
	 * @callback MakeJFOrder_Builder
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  jforder:(NSString*)jforder;

@end
