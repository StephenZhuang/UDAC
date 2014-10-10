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

/**
 余额
	*/
@property(retain) NSString *yue;

@end

/** 查询积分-返回参数(UserJF) */
@interface QueryJdkList: MJsonData


	/**
		评论列表
	*/
	@property(retain) NSMutableArray *data;

@end

/** 参数UserKey */
@interface QueryMonthXse: MJsonData


/**
 单价
	*/
@property(retain) NSString *je;

/**
 总价
	*/
@property(retain) NSString *kccount;

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
/**
 单价
	*/
@property(retain) NSString *dj;

/**
 总价
	*/
@property(retain) NSString *allje;

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

/**
 评论列表
	*/
@property(retain) NSMutableArray *data;

@end

/** 参数UserKey */
@interface KcpdSp: MJsonData


/**
 固定不用管
	*/
@property(retain) NSString *pk_cpkey;

/**
 产品code
	*/
@property(retain) NSString *cpcode;

/**
 产品名称
	*/
@property(retain) NSString *cpname;

/**
 数量
	*/
@property(retain) NSString *cpprice;

/**
 产品名称
	*/
@property(retain) NSMutableArray *smms;

/**
 产品名称
	*/
@property(retain) NSString *smm;

/**
 返回值
	*/
@property(retain) NSString *msg;

@end

/**  */
@interface KupdList: MJsonData


/**
 评论列表
	*/
@property(retain) NSMutableArray *data;

@end

/** 参数UserKey */
@interface Kupd: MJsonData


/**
 固定不用管
	*/
@property(retain) NSString *returntype;

/**
 产品code
	*/
@property(retain) NSString *retuenmsg;

/**
 产品名称
	*/
@property(retain) NSString *smm;

@end

/** 参数UserKey */
@interface QueryJFDetail: MJsonData


/**
 固定不用管
	*/
@property(retain) NSString *mclass;

/**
 产品code
	*/
@property(retain) NSString *datae;

/**
 产品名称
	*/
@property(retain) NSString *dj;

/**
 数量
	*/
@property(retain) NSString *jfshul;

/**
 单价
	*/
@property(retain) NSString *jfslbak;

/**
 总价
	*/
@property(retain) NSString *spcode;

/**
 总价
	*/
@property(retain) NSString *spcount;

/**
 总价
	*/
@property(retain) NSString *spname;

/**
 总价
	*/
@property(retain) NSString *txm;

/**
 总价
	*/
@property(retain) NSString *jlshul;

/**
 总价
	*/
@property(retain) NSString *jlback;

/**
 奖励单价
	*/
@property(retain) NSString *jldj;

/**
 单价
	*/
@property(retain) NSString *je;

/**
 总价
	*/
@property(retain) NSString *kccount;

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

/**  */
@interface QueryJFDetailList: MJsonData


/**
 评论列表
	*/
@property(retain) NSMutableArray *data;

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


/**
 单价
	*/
@property(retain) NSString *dj;

/**
 总价
	*/
@property(retain) NSString *allje;

/**
 奖励单价
	*/
@property(retain) NSString *jldj;

@end

/** 参数UserKey */
@interface MDXX: MJsonData


/**
 归属代理商
	*/
@property(retain) NSString *mydls;

/**
 归属省份
	*/
@property(retain) NSString *mysf;

/**
 归属城市
	*/
@property(retain) NSString *mycity;

/**
 联系人
	*/
@property(retain) NSString *connectman;

/**
 联系电话
	*/
@property(retain) NSString *connectmobile;

/**
 联系地址
	*/
@property(retain) NSString *connectaddr;

/**
 开户省份
	*/
@property(retain) NSString *khsf;

/**
 开户城市
	*/
@property(retain) NSString *khcity;

/**
 开户名
	*/
@property(retain) NSString *psnname;

/**
 银行卡号
	*/
@property(retain) NSString *yhkh;

/**
 开户行
	*/
@property(retain) NSString *khh;

/**
 帐号审批状态
	*/
@property(retain) NSString *appstatus;

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

/**
 库存数量
	*/
@property(retain) NSString *dj;

/**
 库存数量
	*/
@property(retain) NSString *allje;

@end

/** 参数UserJF */
@interface XsckDetail: MJsonData


/**
 固定不用管
	*/
@property(retain) NSString *mclass;

/**
 积分
	*/
@property(retain) NSString *retuenmsg;

/**
 状态
	*/
@property(retain) NSString *returntype;

/**
 序号
	*/
@property(retain) NSString *smm;

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

/**  */
@interface KcpdSpList: MJsonData


/**
 评论列表
	*/
@property(retain) NSMutableArray *data;

@end

