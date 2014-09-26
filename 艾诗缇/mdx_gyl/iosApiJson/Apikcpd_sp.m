//
//  Apikcpd_sp
//
//  Created by liulu on 2014-09-25 18:52:23
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "Apikcpd_sp.h"

@implementation Apikcpd_sp


	/**
	 * 查询库存量 userkeya
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @callback KcpdSpList
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  {
		NSMutableArray *array=[[NSMutableArray alloc]initWithObjects:nil];
		UpdateOne *updateone=[[Updateone2Json alloc] init:@"kcpd_sp" params:array  delegate:delegate selecter:select];
		return [self instanceUpdate:updateone];
	}

	/**
	 * 查询库存量 userkeya
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @callback KcpdSpList
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  {
		UpdateOne *update=[self get:delegate selecter:select];
		[DataManager loadData:[[NSArray alloc]initWithObjects:update,nil] delegate:delegate];
		return update;
	}


@end
