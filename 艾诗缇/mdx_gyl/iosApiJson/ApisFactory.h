//
//  ApisFactory
//
//  Created by liulu on 2014-09-25 18:52:23
//  Copyright (c) liulu All rights reserved.


/**
   apis集合类
*/

#import "Apijf_doQueryAllCanBackCP.h"
#import "Apijf_doMakeJFOrder.h"
#import "Apijf_doQueryAllMyOrder.h"
#import "Apijf_doQueryDetailByCode.h"
#import "Apijf_doDeleteMyOrder.h"
#import "Apijl_doQueryJlJE.h"
#import "Apijl_doMaokeOrder.h"
#import "Apijl_doQueryMyjlOrder.h"
#import "Apijl_doSureMyOrder.h"
#import "Apijl_doDeleteMyOrder.h"
#import "ApidoQueryAllCountAndJE.h"
#import "ApidoAddYhkh.h"
#import "ApidoUpdateMyPWD.h"
#import "ApiDoLogin.h"
#import "ApiDoQueryKc.h"
#import "ApidoQueryMD.h"
#import "ApidoQueryJdk.h"
#import "ApidoXsck.h"
#import "ApidoQueryXjCK.h"
#import "ApidoQueryCKBySMM.h"
#import "Apijf_doQueryJdk.h"
#import "ApidoQueryMonthXse.h"
#import "ApidoQueryJFDetail.h"
#import "Apikcpd_sp.h"
#import "Apikupd.h"
#import "ApidoqueryMyDetailMsg.h"

@interface ApisFactory : NSObject


	
	/**
	 * 1.1	查询可以兑换商品
	 */
	+(Apijf_doQueryAllCanBackCP*) getApijf_doQueryAllCanBackCP;
	
	/**
	 * 1.1	查询可以兑换商品
	 */
	+(Apijf_doMakeJFOrder*) getApijf_doMakeJFOrder;
	
	/**
	 * 1.3	查询我的订单 userkey
	 */
	+(Apijf_doQueryAllMyOrder*) getApijf_doQueryAllMyOrder;
	
	/**
	 * 1.3	查询我的订单 userandcode
	 */
	+(Apijf_doQueryDetailByCode*) getApijf_doQueryDetailByCode;
	
	/**
	 * 1.3	查询我的订单 userandcode
	 */
	+(Apijf_doDeleteMyOrder*) getApijf_doDeleteMyOrder;
	
	/**
	 * 2.3	查询奖励兑换单 userkey
	 */
	+(Apijl_doQueryJlJE*) getApijl_doQueryJlJE;
	
	/**
	 * 2.4	门店确认兑换单 jlorder
	 */
	+(Apijl_doMaokeOrder*) getApijl_doMaokeOrder;
	
	/**
	 * 2.4	门店确认兑换单 userkey
	 */
	+(Apijl_doQueryMyjlOrder*) getApijl_doQueryMyjlOrder;
	
	/**
	 * 2.3	查询奖励兑换单 userandcode
	 */
	+(Apijl_doSureMyOrder*) getApijl_doSureMyOrder;
	
	/**
	 * 2.5	删除奖励兑换单接口 userandcode
	 */
	+(Apijl_doDeleteMyOrder*) getApijl_doDeleteMyOrder;
	
	/**
	 * 2.5	读取总数
	 */
	+(ApidoQueryAllCountAndJE*) getApidoQueryAllCountAndJE;
	
	/**
	 * 2.5	读取总数 useryhkh
	 */
	+(ApidoAddYhkh*) getApidoAddYhkh;
	
	/**
	 * 2.5	读取总数 userkeypwd
	 */
	+(ApidoUpdateMyPWD*) getApidoUpdateMyPWD;
	
	/**
	 * 登录-传入参数(UserInfo)
	 */
	+(ApiDoLogin*) getApiDoLogin;
	
	/**
	 * 查查询库存-传入参数(UserKey)
	 */
	+(ApiDoQueryKc*) getApiDoQueryKc;
	
	/**
	 * 查询门店-传入参数(UserKey)
	 */
	+(ApidoQueryMD*) getApidoQueryMD;
	
	/**
	 * 查询积分-传入参数(UserKey)
	 */
	+(ApidoQueryJdk*) getApidoQueryJdk;
	
	/**
	 * 扫描-传入参数(Userxsck)
	 */
	+(ApidoXsck*) getApidoXsck;
	
	/**
	 * 扫描码查询商品信息 参数 UserMD
	 */
	+(ApidoQueryXjCK*) getApidoQueryXjCK;
	
	/**
	 * 扫描码查询商品信息 参数 UserMD
	 */
	+(ApidoQueryCKBySMM*) getApidoQueryCKBySMM;
	
	/**
	 * 扫描码查询商品信息 参数 UserMD
	 */
	+(Apijf_doQueryJdk*) getApijf_doQueryJdk;
	
	/**
	 * 查询库存量 userkey
	 */
	+(ApidoQueryMonthXse*) getApidoQueryMonthXse;
	
	/**
	 * 查询库存量 userkey
	 */
	+(ApidoQueryJFDetail*) getApidoQueryJFDetail;
	
	/**
	 * 查询库存量 userkeya
	 */
	+(Apikcpd_sp*) getApikcpd_sp;
	
	/**
	 * 查询库存量 kupd
	 */
	+(Apikupd*) getApikupd;
	
	/**
	 * 查询门店信息
	 */
	+(ApidoqueryMyDetailMsg*) getApidoqueryMyDetailMsg;

@end
