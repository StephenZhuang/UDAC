//
//  Apijf_doMakeJFOrder
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "Apijf_doMakeJFOrder.h"

@implementation Apijf_doMakeJFOrder


	/**
	 * 1.1	查询可以兑换商品
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param jforder  传递参数:[{"class":"com.shqj.webservice.entity.JFBackOrder","count":12,"pk_cpkey":"商品KEY","pk_key":"门店KEY”}]
	 * @callback MakeJFOrder
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  jforder:(NSString*)jforder {
		NSMutableArray *array=[[NSMutableArray alloc]initWithObjects:nil];
		[array addObject:[NSString stringWithFormat:@"jforder=%@",jforder==nil?@"":jforder]];
		UpdateOne *updateone=[[Updateone2Json alloc] init:@"jf_doMakeJFOrder" params:array  delegate:delegate selecter:select];
		return [self instanceUpdate:updateone];
	}

	/**
	 * 1.1	查询可以兑换商品
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param jforder  传递参数:[{"class":"com.shqj.webservice.entity.JFBackOrder","count":12,"pk_cpkey":"商品KEY","pk_key":"门店KEY”}]
	 * @callback MakeJFOrder
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  jforder:(NSString*)jforder {
		UpdateOne *update=[self get:delegate selecter:select jforder:jforder];
		[DataManager loadData:[[NSArray alloc]initWithObjects:update,nil] delegate:delegate];
		return update;
	}


@end
