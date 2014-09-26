//
//  ApidoqueryMyDetailMsg
//
//  Created by liulu on 2014-09-25 18:52:23
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "ApidoqueryMyDetailMsg.h"

@implementation ApidoqueryMyDetailMsg


	/**
	 * 查询门店信息
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param key  null
	 * @callback MDXX
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  key:(NSString*)key {
		NSMutableArray *array=[[NSMutableArray alloc]initWithObjects:nil];
		[array addObject:[NSString stringWithFormat:@"key=%@",key==nil?@"":key]];
		UpdateOne *updateone=[[Updateone2Json alloc] init:@"doqueryMyDetailMsg" params:array  delegate:delegate selecter:select];
		return [self instanceUpdate:updateone];
	}

	/**
	 * 查询门店信息
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param key  null
	 * @callback MDXX
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  key:(NSString*)key {
		UpdateOne *update=[self get:delegate selecter:select key:key];
		[DataManager loadData:[[NSArray alloc]initWithObjects:update,nil] delegate:delegate];
		return update;
	}


@end
