//
//  Apikupd
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "Apikupd.h"

@implementation Apikupd


	/**
	 * 查询库存量 kupd
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param kupd  null
	 * @callback KupdList_Builder
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  kupd:(NSString*)kupd {
		NSMutableArray *array=[[NSMutableArray alloc]initWithObjects:nil];
		[array addObject:[NSString stringWithFormat:@"kupd=%@",kupd==nil?@"":kupd]];
		UpdateOne *updateone=[[UpdateOne alloc] init:@"kupd" params:array  delegate:delegate selecter:select];
		return [self instanceUpdate:updateone];
	}

	/**
	 * 查询库存量 kupd
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param kupd  null
	 * @callback KupdList_Builder
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  kupd:(NSString*)kupd {
		UpdateOne *update=[self get:delegate selecter:select kupd:kupd];
		[DataManager loadData:[[NSArray alloc]initWithObjects:update,nil] delegate:delegate];
		return update;
	}


@end
