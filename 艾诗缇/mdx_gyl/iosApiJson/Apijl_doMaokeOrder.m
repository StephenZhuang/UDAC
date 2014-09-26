//
//  Apijl_doMaokeOrder
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "Apijl_doMaokeOrder.h"

@implementation Apijl_doMaokeOrder


	/**
	 * 2.4	门店确认兑换单 jlorder
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param class  分类 default com.shqj.webservice.entity.JLDHOrder
	 * @param dcount  要兑换的奖励金额
	 * @param pk_key  当前门店KEY
	 * @callback MakeJFOrder
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  class:(NSString*)class dcount:(NSString*)dcount pk_key:(NSString*)pk_key {
		NSMutableArray *array=[[NSMutableArray alloc]initWithObjects:nil];
		[array addObject:[NSString stringWithFormat:@"class=%@",class==nil?@"com.shqj.webservice.entity.JLDHOrder":class==nil?@"":class]];
		[array addObject:[NSString stringWithFormat:@"dcount=%@",dcount==nil?@"":dcount]];
		[array addObject:[NSString stringWithFormat:@"pk_key=%@",pk_key==nil?@"":pk_key]];
		UpdateOne *updateone=[[Updateone2Json alloc] init:@"jl_doMaokeOrder" params:array  delegate:delegate selecter:select];
		return [self instanceUpdate:updateone];
	}

	/**
	 * 2.4	门店确认兑换单 jlorder
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param class  分类 default com.shqj.webservice.entity.JLDHOrder
	 * @param dcount  要兑换的奖励金额
	 * @param pk_key  当前门店KEY
	 * @callback MakeJFOrder
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  class:(NSString*)class dcount:(NSString*)dcount pk_key:(NSString*)pk_key {
		UpdateOne *update=[self get:delegate selecter:select class:class dcount:dcount pk_key:pk_key];
		[DataManager loadData:[[NSArray alloc]initWithObjects:update,nil] delegate:delegate];
		return update;
	}


@end
