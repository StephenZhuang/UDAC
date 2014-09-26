//
//  Apijf_doQueryAllCanBackCP
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "ApiUpdate.h"


@interface Apijf_doQueryAllCanBackCP : ApiUpdate


	/**
	 * 1.1	查询可以兑换商品
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @callback QueryAllCanBackCPList_Builder
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select ;
	/**
	 * 1.1	查询可以兑换商品
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @callback QueryAllCanBackCPList_Builder
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select ;

@end
