//
//  GongT.h
//  GongT
//
//  Created by ryan on 2014-08-13 18:50:48
//  Copyright (c) ryan All rights reserved.
//
//
/**

**/
#import <Foundation/Foundation.h>

#import "MJsonData.h"


/**  */
@interface QueryAllMyOrder: MJsonData


	/**
		总数
	*/
	@property(retain) NSNumber *allcount;

	/**
		总额
	*/
	@property(retain) NSNumber *allprice;

	/**
		审批日期
	*/
	@property(retain) NSString *appdate;

	/**
		发货状态
	*/
	@property(retain) NSString *appstatus;

	/**
		兑换日期
	*/
	@property(retain) NSString *backdate;
	@property(retain) NSString *mclass;

	/**
		联系地址
	*/
	@property(retain) NSString *connectaddr;

	/**
		联系人
	*/
	@property(retain) NSString *connectman;

	/**
		 联系电话
	*/
	@property(retain) NSString *connectmoblie;

	/**
		单据号
	*/
	@property(retain) NSString *dbillcode;

	/**
		货运单号 
	*/
	@property(retain) NSString *sendcode;

	/**
		发货公司
	*/
	@property(retain) NSString *sendcorp;

	/**
		发货日期
	*/
	@property(retain) NSString *senddate;

	/**
		发货状态
	*/
	@property(retain) NSString *sendstatus;

	/**
		商品编码
	*/
	@property(retain) NSString *cpcode;

	/**
		商品名称
	*/
	@property(retain) NSString *cpname;

	/**
		商品数量
	*/
	@property(retain) NSNumber *cpcount;

	/**
		商品单价
	*/
	@property(retain) NSNumber *cpprice;

	/**
		商品总额
	*/
//	@property(retain) NSString *allprice;

@end

/** 查询库存-返回参数(UserccReturn) */
@interface QueryAllMyOrderList: MJsonData


	/**
		评论列表
	*/
	@property(retain) NSMutableArray *data;

@end

/**  */
@interface QueryJlJECount: MJsonData


	/**
		代表总额
	*/
	@property(retain) NSNumber *je;

	/**
		代表总数量 
	*/
	@property(retain) NSNumber *kccount;

@end

/**  */
@interface QueryJlJE: MJsonData


	/**
		累计奖励额度
	*/
	@property(retain) NSNumber *allje;

	/**
		兑换额度
	*/
	@property(retain) NSNumber *dhje;

	/**
		发放金额
	*/
	@property(retain) NSNumber *ffe;

	/**
		余额 
	*/
	@property(retain) NSNumber *yue;

@end

/**  */
@interface QueryAllCanBackCP: MJsonData


	/**
		固定不用管
	*/
	@property(retain) NSString *mclass;

	/**
		商品编码
	*/
	@property(retain) NSString *cpcode;

	/**
		商品名称
	*/
	@property(retain) NSString *cpname;

	/**
		产品Key
	*/
	@property(retain) NSString *pk_cpkey;

	/**
		产品单价
	*/
	@property(retain) NSNumber *cpprice;
    @property(assign) int num;

@end

/** 查询库存-返回参数(UserccReturn) */
@interface QueryDetailByCodeList: MJsonData


	/**
		评论列表
	*/
	@property(retain) NSMutableArray *data;

@end

/**  */
@interface MakeJFOrder: MJsonData


	/**
		对应的失败或者成功信息，成功的时候也要提示信息s
	*/
	@property(retain) NSString *retuenmsg;

	/**
		1 代表成功 2 代表失败
	*/
	@property(retain) NSString *returntype;

	/**
		商品名称
	*/
	@property(retain) NSString *mclass;

@end

/**  */
@interface QueryDetailByCode: MJsonData


	/**
		商品编码
	*/
	@property(retain) NSString *cpcode;

	/**
		商品名称
	*/
	@property(retain) NSString *cpname;

	/**
		商品数量
	*/
	@property(retain) NSString *cpcount;

	/**
		商品单价
	*/
	@property(retain) NSString *cpprice;

	/**
		商品总额
	*/
	@property(retain) NSString *allprice;

@end

/** 查询库存-返回参数(UserccReturn) */
@interface QueryAllCanBackCPList: MJsonData


	/**
		评论列表
	*/
	@property(retain) NSMutableArray *data;

@end

/**  */
@interface QueryAllMyJLOrder: MJsonData


	/**
		总数
	*/
	@property(retain) NSString *dbillcode;

	/**
		总额
	*/
	@property(retain) NSNumber *allcount;

	/**
		审批日期
	*/
	@property(retain) NSString *backdate;

	/**
		发货状态
	*/
	@property(retain) NSString *appstatus;

	/**
		兑换日期
	*/
	@property(retain) NSString *appdate;
	@property(retain) NSString *sendstatus;

	/**
		联系地址
	*/
	@property(retain) NSString *senddate;

	/**
		联系人
	*/
	@property(retain) NSNumber *sendcount;

	/**
		 联系电话
	*/
	@property(retain) NSString *surestatus;

	/**
		货运单号 
	*/
	@property(retain) NSString *suredate;

@end

/** 查询库存-返回参数(UserccReturn) */
@interface QueryAllMyJLOrderList: MJsonData


/**
 评论列表
 */
@property(retain) NSMutableArray *data;

@end