//
//  ApidoQueryAllCountAndJE
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "ApiUpdate.h"


@interface ApidoQueryAllCountAndJE : ApiUpdate


	/**
	 * 2.5	读取总数
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @callback QueryJlJECount_Builder
	 * @param class  分类 default com.shqj.webservice.entity.UserKey
	 * @param key  当前门店KEY
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  class:(NSString*)class key:(NSString*)key;
	/**
	 * 2.5	读取总数
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param class  分类 default com.shqj.webservice.entity.UserKey
	 * @param key  当前门店KEY
	 * @callback QueryJlJECount_Builder
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  class:(NSString*)class key:(NSString*)key;

@end
