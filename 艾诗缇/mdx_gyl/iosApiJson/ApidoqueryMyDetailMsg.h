//
//  ApidoqueryMyDetailMsg
//
//  Created by liulu on 2014-09-25 18:52:23
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "ApiUpdate.h"


@interface ApidoqueryMyDetailMsg : ApiUpdate


	/**
	 * 查询门店信息
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @callback MDXX
	 * @param key  null
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  key:(NSString*)key;
	/**
	 * 查询门店信息
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param key  null
	 * @callback MDXX
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  key:(NSString*)key;

@end
