//
//  Apijf_doQueryJdk
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "Apijf_doQueryJdk.h"

@implementation Apijf_doQueryJdk


	/**
	 * 扫描码查询商品信息 参数 UserMD
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param key  当前门店或代理商的key
	 * @param class  分类 default com.shqj.webservice.entity.UserKeyAndSMCode
	 * @param smcode  扫描码
	 * @callback QueryCKBySMMList_Builder
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  key:(NSString*)key class:(NSString*)class smcode:(NSString*)smcode {
		NSMutableArray *array=[[NSMutableArray alloc]initWithObjects:nil];
		[array addObject:[NSString stringWithFormat:@"key=%@",key==nil?@"":key]];
		[array addObject:[NSString stringWithFormat:@"class=%@",class==nil?@"com.shqj.webservice.entity.UserKeyAndSMCode":class==nil?@"":class]];
		[array addObject:[NSString stringWithFormat:@"smcode=%@",smcode==nil?@"":smcode]];
		UpdateOne *updateone=[[UpdateOne alloc] init:@"jf_doQueryJdk" params:array  delegate:delegate selecter:select];
		return [self instanceUpdate:updateone];
	}

	/**
	 * 扫描码查询商品信息 参数 UserMD
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param key  当前门店或代理商的key
	 * @param class  分类 default com.shqj.webservice.entity.UserKeyAndSMCode
	 * @param smcode  扫描码
	 * @callback QueryCKBySMMList_Builder
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  key:(NSString*)key class:(NSString*)class smcode:(NSString*)smcode {
		UpdateOne *update=[self get:delegate selecter:select key:key class:class smcode:smcode];
		[DataManager loadData:[[NSArray alloc]initWithObjects:update,nil] delegate:delegate];
		return update;
	}


@end
