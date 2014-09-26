//
//  ApidoUpdateMyPWD
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "ApidoUpdateMyPWD.h"

@implementation ApidoUpdateMyPWD


	/**
	 * 2.5	读取总数 userkeypwd
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param class  分类 default com.shqj.webservice.entity.UserKeyPwd
	 * @param key  当前门店KEY
	 * @param pwd  当前门店KEY
	 * @callback MakeJFOrder_Builder
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  class:(NSString*)class key:(NSString*)key pwd:(NSString*)pwd {
		NSMutableArray *array=[[NSMutableArray alloc]initWithObjects:nil];
		[array addObject:[NSString stringWithFormat:@"class=%@",class==nil?@"com.shqj.webservice.entity.UserKeyPwd":class==nil?@"":class]];
		[array addObject:[NSString stringWithFormat:@"key=%@",key==nil?@"":key]];
		[array addObject:[NSString stringWithFormat:@"pwd=%@",pwd==nil?@"":pwd]];
		UpdateOne *updateone=[[UpdateOne alloc] init:@"doUpdateMyPWD" params:array  delegate:delegate selecter:select];
		return [self instanceUpdate:updateone];
	}

	/**
	 * 2.5	读取总数 userkeypwd
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param class  分类 default com.shqj.webservice.entity.UserKeyPwd
	 * @param key  当前门店KEY
	 * @param pwd  当前门店KEY
	 * @callback MakeJFOrder_Builder
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  class:(NSString*)class key:(NSString*)key pwd:(NSString*)pwd {
		UpdateOne *update=[self get:delegate selecter:select class:class key:key pwd:pwd];
		[DataManager loadData:[[NSArray alloc]initWithObjects:update,nil] delegate:delegate];
		return update;
	}


@end
