//
//  ApidoAddYhkh
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "ApidoAddYhkh.h"

@implementation ApidoAddYhkh


	/**
	 * 2.5	读取总数 useryhkh
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param class  分类 default com.shqj.webservice.entity.UserYHKH
	 * @param key  当前门店KEY
	 * @param khcity  当前门店KEY
	 * @param khsf  当前门店KEY
	 * @param psnname  当前门店KEY
	 * @param yhkh  当前门店KEY
	 * @callback MakeJFOrder
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  class:(NSString*)class key:(NSString*)key khcity:(NSString*)khcity khsf:(NSString*)khsf psnname:(NSString*)psnname yhkh:(NSString*)yhkh {
		NSMutableArray *array=[[NSMutableArray alloc]initWithObjects:nil];
		[array addObject:[NSString stringWithFormat:@"class=%@",class==nil?@"com.shqj.webservice.entity.UserYHKH":class==nil?@"":class]];
		[array addObject:[NSString stringWithFormat:@"key=%@",key==nil?@"":key]];
		[array addObject:[NSString stringWithFormat:@"khcity=%@",khcity==nil?@"":khcity]];
		[array addObject:[NSString stringWithFormat:@"khsf=%@",khsf==nil?@"":khsf]];
		[array addObject:[NSString stringWithFormat:@"psnname=%@",psnname==nil?@"":psnname]];
		[array addObject:[NSString stringWithFormat:@"yhkh=%@",yhkh==nil?@"":yhkh]];
		UpdateOne *updateone=[[Updateone2Json alloc] init:@"doAddYhkh" params:array  delegate:delegate selecter:select];
		return [self instanceUpdate:updateone];
	}

	/**
	 * 2.5	读取总数 useryhkh
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param class  分类 default com.shqj.webservice.entity.UserYHKH
	 * @param key  当前门店KEY
	 * @param khcity  当前门店KEY
	 * @param khsf  当前门店KEY
	 * @param psnname  当前门店KEY
	 * @param yhkh  当前门店KEY
	 * @callback MakeJFOrder
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  class:(NSString*)class key:(NSString*)key khcity:(NSString*)khcity khsf:(NSString*)khsf psnname:(NSString*)psnname yhkh:(NSString*)yhkh {
		UpdateOne *update=[self get:delegate selecter:select class:class key:key khcity:khcity khsf:khsf psnname:psnname yhkh:yhkh];
		[DataManager loadData:[[NSArray alloc]initWithObjects:update,nil] delegate:delegate];
		return update;
	}


@end
