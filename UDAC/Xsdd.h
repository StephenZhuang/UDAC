//
//  Xsdd.h
//  Xsdd
//
//  Created by liulu on 2014-10-07 17:13:11
//  Copyright (c) liulu All rights reserved.
//
//
/**

**/
#import <Foundation/Foundation.h>

#import "MJsonData.h"


/**  */
@interface XsddQueryAllOrder: MJsonData


	/**
		订单号
	*/
	@property(retain) NSString *billcode;

	/**
		订单日期
	*/
	@property(retain) NSString *riqi;

	/**
		客户
	*/
	@property(retain) NSString *kh;

	/**
		收货单位
	*/
	@property(retain) NSString *shdw;

	/**
		收货地址
	*/
	@property(retain) NSString *shdiz;

	/**
		业务员
	*/
	@property(retain) NSString *ywy;

@end

/** 销售订单列表 */
@interface XsddQueryAllOrderList: MJsonData


	/**
		评论列表
	*/
	@property(retain) NSMutableArray *data;

@end

/**  */
@interface Retn: MJsonData


	/**
		商品编号
	*/
	@property(retain) NSString *returntype;
	@property(retain) NSString *retuenmsg;

@end

/** 销售订单列表 */
@interface RetnList: MJsonData


	/**
		评论列表
	*/
	@property(retain) NSMutableArray *data;

@end

/**  */
@interface XsddQuerydetailOrder: MJsonData


	/**
		商品编号
	*/
	@property(retain) NSString *spcode;

	/**
		名称
	*/
	@property(retain) NSString *spname;

	/**
		数量
	*/
	@property(retain) NSString *spcount;

@end

/** 销售订单列表 */
@interface XsddQuerydetailOrderList: MJsonData


	/**
		订单商品明细
	*/
	@property(retain) NSMutableArray *data;

@end

