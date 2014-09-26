//
//  Apijl_doDeleteMyOrder
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "Apijl_doDeleteMyOrder.h"

@implementation Apijl_doDeleteMyOrder


	/**
	 * 2.5	删除奖励兑换单接口 userandcode
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param class  分类 default com.shqj.webservice.entity.UserKeyAndOrderCode
	 * @param key  当前门店KEY
	 * @param billcode  订单号
	 * @callback MakeJFOrder_Builder
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  class:(NSString*)class key:(NSString*)key billcode:(NSString*)billcode {
		NSMutableArray *array=[[NSMutableArray alloc]initWithObjects:nil];
		[array addObject:[NSString stringWithFormat:@"class=%@",class==nil?@"com.shqj.webservice.entity.UserKeyAndOrderCode":class==nil?@"":class]];
		[array addObject:[NSString stringWithFormat:@"key=%@",key==nil?@"":key]];
		[array addObject:[NSString stringWithFormat:@"billcode=%@",billcode==nil?@"":billcode]];
		UpdateOne *updateone=[[UpdateOne alloc] init:@"jl_doDeleteMyOrder" params:array  delegate:delegate selecter:select];
		return [self instanceUpdate:updateone];
	}

	/**
	 * 2.5	删除奖励兑换单接口 userandcode
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param class  分类 default com.shqj.webservice.entity.UserKeyAndOrderCode
	 * @param key  当前门店KEY
	 * @param billcode  订单号
	 * @callback MakeJFOrder_Builder
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  class:(NSString*)class key:(NSString*)key billcode:(NSString*)billcode {
		UpdateOne *update=[self get:delegate selecter:select class:class key:key billcode:billcode];
		[DataManager loadData:[[NSArray alloc]initWithObjects:update,nil] delegate:delegate];
		return update;
	}


@end
