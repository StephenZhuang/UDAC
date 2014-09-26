//
//  Apijf_doQueryAllCanBackCP
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "Apijf_doQueryAllCanBackCP.h"

@implementation Apijf_doQueryAllCanBackCP


	/**
	 * 1.1	查询可以兑换商品
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @callback QueryAllCanBackCPList_Builder
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  {
		NSMutableArray *array=[[NSMutableArray alloc]initWithObjects:nil];
		UpdateOne *updateone=[[UpdateOne alloc] init:@"jf_doQueryAllCanBackCP" params:array  delegate:delegate selecter:select];
		return [self instanceUpdate:updateone];
	}

	/**
	 * 1.1	查询可以兑换商品
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @callback QueryAllCanBackCPList_Builder
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  {
		UpdateOne *update=[self get:delegate selecter:select];
		[DataManager loadData:[[NSArray alloc]initWithObjects:update,nil] delegate:delegate];
		return update;
	}


@end
