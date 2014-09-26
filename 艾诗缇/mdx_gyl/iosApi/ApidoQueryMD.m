//
//  ApidoQueryMD
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "ApidoQueryMD.h"

@implementation ApidoQueryMD


	/**
	 * 查询门店-传入参数(UserKey)
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param key  当前门店或代理商的key
	 * @param class  分类 default com.shqj.webservice.entity.UserKey
	 * @callback QueryMdList_Builder
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  key:(NSString*)key class:(NSString*)class {
		NSMutableArray *array=[[NSMutableArray alloc]initWithObjects:nil];
		[array addObject:[NSString stringWithFormat:@"key=%@",key==nil?@"":key]];
		[array addObject:[NSString stringWithFormat:@"class=%@",class==nil?@"com.shqj.webservice.entity.UserKey":class==nil?@"":class]];
		UpdateOne *updateone=[[UpdateOne alloc] init:@"doQueryMD" params:array  delegate:delegate selecter:select];
		return [self instanceUpdate:updateone];
	}

	/**
	 * 查询门店-传入参数(UserKey)
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param key  当前门店或代理商的key
	 * @param class  分类 default com.shqj.webservice.entity.UserKey
	 * @callback QueryMdList_Builder
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  key:(NSString*)key class:(NSString*)class {
		UpdateOne *update=[self get:delegate selecter:select key:key class:class];
		[DataManager loadData:[[NSArray alloc]initWithObjects:update,nil] delegate:delegate];
		return update;
	}


@end
