//
//  Apikcpd_sp
//
//  Created by liulu on 2014-09-25 18:52:23
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "ApiUpdate.h"


@interface Apikcpd_sp : ApiUpdate


	/**
	 * 查询库存量 userkeya
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @callback KcpdSpList
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select ;
	/**
	 * 查询库存量 userkeya
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @callback KcpdSpList
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select ;

@end
