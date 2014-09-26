//
//  Apikupd
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "ApiUpdate.h"


@interface Apikupd : ApiUpdate


	/**
	 * 查询库存量 kupd
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @callback KupdList_Builder
	 * @param kupd  null
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  kupd:(NSString*)kupd;
	/**
	 * 查询库存量 kupd
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param kupd  null
	 * @callback KupdList_Builder
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  kupd:(NSString*)kupd;

@end
