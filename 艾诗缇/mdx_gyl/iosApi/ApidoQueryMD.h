//
//  ApidoQueryMD
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "ApiUpdate.h"


@interface ApidoQueryMD : ApiUpdate


	/**
	 * 查询门店-传入参数(UserKey)
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @callback QueryMdList_Builder
	 * @param key  当前门店或代理商的key
	 * @param class  分类 default com.shqj.webservice.entity.UserKey
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  key:(NSString*)key class:(NSString*)class;
	/**
	 * 查询门店-传入参数(UserKey)
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param key  当前门店或代理商的key
	 * @param class  分类 default com.shqj.webservice.entity.UserKey
	 * @callback QueryMdList_Builder
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  key:(NSString*)key class:(NSString*)class;

@end
