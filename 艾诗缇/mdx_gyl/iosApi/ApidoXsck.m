//
//  ApidoXsck
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "ApidoXsck.h"

@implementation ApidoXsck


	/**
	 * 扫描-传入参数(Userxsck)
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param key  当前扫描人对应的KEY
	 * @param class  分类 default com.shqj.webservice.entity.Userxsck
	 * @param mdkey  1.门店key，如果当前是代理商，这里就必须带有门店的key，这样后台才能知道，代理商的商品是卖给谁的 2. 如果当前人是门店，这里就随便写一个就行了
	 * @param isth  如果当前是门店，并且是退货扫描，这里要填写Y，如果是其他扫描，则不用写任何东西
	 * @param smcode  扫描时候对应的扫描码
	 * @callback Xsck_Builder
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  key:(NSString*)key class:(NSString*)class mdkey:(NSString*)mdkey isth:(NSString*)isth smcode:(NSString*)smcode {
		NSMutableArray *array=[[NSMutableArray alloc]initWithObjects:nil];
		[array addObject:[NSString stringWithFormat:@"key=%@",key==nil?@"":key]];
		[array addObject:[NSString stringWithFormat:@"class=%@",class==nil?@"com.shqj.webservice.entity.Userxsck":class==nil?@"":class]];
		[array addObject:[NSString stringWithFormat:@"mdkey=%@",mdkey==nil?@"":mdkey]];
		[array addObject:[NSString stringWithFormat:@"isth=%@",isth==nil?@"":isth]];
		[array addObject:[NSString stringWithFormat:@"smcode=%@",smcode==nil?@"":smcode]];
		UpdateOne *updateone=[[UpdateOne alloc] init:@"doXsck" params:array  delegate:delegate selecter:select];
		return [self instanceUpdate:updateone];
	}

	/**
	 * 扫描-传入参数(Userxsck)
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param key  当前扫描人对应的KEY
	 * @param class  分类 default com.shqj.webservice.entity.Userxsck
	 * @param mdkey  1.门店key，如果当前是代理商，这里就必须带有门店的key，这样后台才能知道，代理商的商品是卖给谁的 2. 如果当前人是门店，这里就随便写一个就行了
	 * @param isth  如果当前是门店，并且是退货扫描，这里要填写Y，如果是其他扫描，则不用写任何东西
	 * @param smcode  扫描时候对应的扫描码
	 * @callback Xsck_Builder
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  key:(NSString*)key class:(NSString*)class mdkey:(NSString*)mdkey isth:(NSString*)isth smcode:(NSString*)smcode {
		UpdateOne *update=[self get:delegate selecter:select key:key class:class mdkey:mdkey isth:isth smcode:smcode];
		[DataManager loadData:[[NSArray alloc]initWithObjects:update,nil] delegate:delegate];
		return update;
	}


@end
