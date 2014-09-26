//
//  Apijl_doSureMyOrder
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "Apijl_doSureMyOrder.h"

@implementation Apijl_doSureMyOrder


	/**
	 * 2.3	查询奖励兑换单 userandcode
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param class  分类 default com.shqj.webservice.entity.UserKeyAndOrderCode
	 * @param key  当前门店KEY
	 * @param billcode  订单号
	 * @callback MakeJFOrder
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  class:(NSString*)class key:(NSString*)key billcode:(NSString*)billcode {
		NSMutableArray *array=[[NSMutableArray alloc]initWithObjects:nil];
		[array addObject:[NSString stringWithFormat:@"class=%@",class==nil?@"com.shqj.webservice.entity.UserKeyAndOrderCode":class==nil?@"":class]];
		[array addObject:[NSString stringWithFormat:@"key=%@",key==nil?@"":key]];
		[array addObject:[NSString stringWithFormat:@"billcode=%@",billcode==nil?@"":billcode]];
		UpdateOne *updateone=[[Updateone2Json alloc] init:@"jl_doSureMyOrder" params:array  delegate:delegate selecter:select];
		return [self instanceUpdate:updateone];
	}

	/**
	 * 2.3	查询奖励兑换单 userandcode
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param class  分类 default com.shqj.webservice.entity.UserKeyAndOrderCode
	 * @param key  当前门店KEY
	 * @param billcode  订单号
	 * @callback MakeJFOrder
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  class:(NSString*)class key:(NSString*)key billcode:(NSString*)billcode {
		UpdateOne *update=[self get:delegate selecter:select class:class key:key billcode:billcode];
		[DataManager loadData:[[NSArray alloc]initWithObjects:update,nil] delegate:delegate];
		return update;
	}


@end
