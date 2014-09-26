//
//  Apijf_doQueryAllMyOrder
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "Apijf_doQueryAllMyOrder.h"

@implementation Apijf_doQueryAllMyOrder


	/**
	 * 1.3	查询我的订单 userkey
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param class  分类 default com.shqj.webservice.entity.UserKey
	 * @param key  当前门店KEY
	 * @callback QueryAllMyOrderList_Builder
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  class:(NSString*)class key:(NSString*)key {
		NSMutableArray *array=[[NSMutableArray alloc]initWithObjects:nil];
		[array addObject:[NSString stringWithFormat:@"class=%@",class==nil?@"com.shqj.webservice.entity.UserKey":class==nil?@"":class]];
		[array addObject:[NSString stringWithFormat:@"key=%@",key==nil?@"":key]];
		UpdateOne *updateone=[[UpdateOne alloc] init:@"jf_doQueryAllMyOrder" params:array  delegate:delegate selecter:select];
		return [self instanceUpdate:updateone];
	}

	/**
	 * 1.3	查询我的订单 userkey
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param class  分类 default com.shqj.webservice.entity.UserKey
	 * @param key  当前门店KEY
	 * @callback QueryAllMyOrderList_Builder
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  class:(NSString*)class key:(NSString*)key {
		UpdateOne *update=[self get:delegate selecter:select class:class key:key];
		[DataManager loadData:[[NSArray alloc]initWithObjects:update,nil] delegate:delegate];
		return update;
	}


@end
