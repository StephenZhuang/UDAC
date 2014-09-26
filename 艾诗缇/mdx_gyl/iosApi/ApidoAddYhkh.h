//
//  ApidoAddYhkh
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

#import "ApiUpdate.h"


@interface ApidoAddYhkh : ApiUpdate


	/**
	 * 2.5	读取总数 useryhkh
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @callback MakeJFOrder_Builder
	 * @param class  分类 default com.shqj.webservice.entity.UserYHKH
	 * @param key  当前门店KEY
	 * @param khcity  当前门店KEY
	 * @param khsf  当前门店KEY
	 * @param psnname  当前门店KEY
	 * @param yhkh  当前门店KEY
	*/
	-(UpdateOne*)get:(id)delegate selecter:(SEL)select  class:(NSString*)class key:(NSString*)key khcity:(NSString*)khcity khsf:(NSString*)khsf psnname:(NSString*)psnname yhkh:(NSString*)yhkh;
	/**
	 * 2.5	读取总数 useryhkh
	 * @param delegate 回调类
	 * @param select  回调函数
	 * @param class  分类 default com.shqj.webservice.entity.UserYHKH
	 * @param key  当前门店KEY
	 * @param khcity  当前门店KEY
	 * @param khsf  当前门店KEY
	 * @param psnname  当前门店KEY
	 * @param yhkh  当前门店KEY
	 * @callback MakeJFOrder_Builder
	*/
	-(UpdateOne*)load:(id)delegate selecter:(SEL)select  class:(NSString*)class key:(NSString*)key khcity:(NSString*)khcity khsf:(NSString*)khsf psnname:(NSString*)psnname yhkh:(NSString*)yhkh;

@end
