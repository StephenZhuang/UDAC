//
//  Gongying.h
//  Gongying
//
//  Created by ryan on 2014-07-02 18:28:21
//  Copyright (c) ryan All rights reserved.
//
//
/**

**/
#import <Foundation/Foundation.h>
#import "MJsonData.h"
#import "Frame.h"

/** 参数UserJF */
@interface QueryJdk: MJsonData


	/**
		固定不用管
	*/
	@property(retain) NSString *mclass;

	/**
		积分
	*/
	@property(retain) NSNumber *jf;

	/**
		已兑换积分
	*/
	@property(retain) NSNumber *jfbak;

	/**
		日期
	*/
	@property(retain) NSString *rq;

@end

/** 查询积分-返回参数(UserJF) */
@interface QueryJdkList: MJsonData


	/**
		评论列表
	*/
	@property(retain) NSMutableArray *data;

@end

/** 登录-返回参数(ReturnUser) */
@interface Login: MJsonData


	/**
		固定不用管
	*/
	@property(retain) NSString *mclass;

	/**
		1登录成功,2登录失败
	*/
	@property(retain) NSString *returntype;

	/**
		1代理商  2门店
	*/
	@property(retain) NSString *usertype;

	/**
		登录成功后给出对应店铺名称
	*/
	@property(retain) NSString *deptname;

	/**
		登录key  
	*/
	@property(retain) NSString *key;

@end

/** 参数UserKey */
@interface QueryXjCK: MJsonData


	/**
		固定不用管
	*/
	@property(retain) NSString *mclass;

	/**
		返回门店的key
	*/
	@property(retain) NSString *key;

	/**
		门店编码
	*/
	@property(retain) NSString *mdcode;

	/**
		门店名称
	*/
	@property(retain) NSString *mdname;

	/**
		产品code
	*/
	@property(retain) NSString *spcode;

	/**
		产品名称
	*/
	@property(retain) NSString *spname;

	/**
		数量
	*/
	@property(retain) NSNumber *spcount;

@end

/** 扫描-传入参数(UserReturnMSG) */
@interface Xsck: MJsonData


	/**
		固定不用管
	*/
	@property(retain) NSString *mclass;

	/**
		1代表成功,2代表失败
	*/
	@property(retain) NSString *returntype;

	/**
		出现错误时候，这里给出错误信息
	*/
	@property(retain) NSString *retuenmsg;

@end

/**  */
@interface QueryXjCKList: MJsonData


	/**
		评论列表
	*/
	@property(retain) NSMutableArray *data;

@end

/**  */
@interface QueryMd: MJsonData


	/**
		固定不用管
	*/
	@property(retain) NSString *mclass;

	/**
		商品编码
	*/
	@property(retain) NSString *key;

	/**
		商品名称
	*/
	@property(retain) NSString *mdcode;

	/**
		库存数量
	*/
	@property(retain) NSString *mdname;

@end

/** 参数UserKey */
@interface QueryCKBySMM: MJsonData


	/**
		固定不用管
	*/
	@property(retain) NSString *mclass;

	/**
		产品code
	*/
	@property(retain) NSString *spcode;

	/**
		产品名称
	*/
	@property(retain) NSString *spname;

	/**
		数量
	*/
	@property(retain) NSNumber *spcount;

@end

/** 查询门店-返回参数(UserMD) */
@interface QueryMdList: MJsonData


	/**
		评论列表
	*/
	@property(retain) NSMutableArray *data;

@end

/**  */
@interface QueryKc: MJsonData


	/**
		固定不用管
	*/
	@property(retain) NSString *mclass;

	/**
		商品编码
	*/
	@property(retain) NSString *spcode;

	/**
		商品名称
	*/
	@property(retain) NSString *spname;

	/**
		库存数量
	*/
	@property(retain) NSNumber *spcount;

@end

/** 查询库存-返回参数(UserccReturn) */
@interface QueryKcList: MJsonData


	/**
		评论列表
	*/
	@property(retain) NSMutableArray *data;

@end

/**  */
@interface QueryCKBySMMList: MJsonData


	/**
		评论列表
	*/
	@property(retain) NSMutableArray *data;

@end

