//
//  Apijf_doQueryJdk
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "ApiUpdate.h"


@interface Apijf_doQueryJdk : ApiUpdate


	/**
	 * 扫描码查询商品信息 参数 UserMD
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @callback QueryCKBySMMList
	 * @param key  当前门店或代理商的key
	 * @param class  分类 default com.shqj.webservice.entity.UserKeyAndSMCode
	 * @param smcode  扫描码
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  key:(NSString*)key class:(NSString*)class smcode:(NSString*)smcode;
	/**
	 * 扫描码查询商品信息 参数 UserMD
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param key  当前门店或代理商的key
	 * @param class  分类 default com.shqj.webservice.entity.UserKeyAndSMCode
	 * @param smcode  扫描码
	 * @callback QueryCKBySMMList
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  key:(NSString*)key class:(NSString*)class smcode:(NSString*)smcode;

@end
