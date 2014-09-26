//
//  ApisFactory
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   apis集合类
*/

#import "ApisFactory.h"

@implementation ApisFactory


	
	/**
	 * 1.1	查询可以兑换商品
	 */
	+(Apijf_doQueryAllCanBackCP*) getApijf_doQueryAllCanBackCP{
		return [[Apijf_doQueryAllCanBackCP alloc ] init];
	}
	
	/**
	 * 1.1	查询可以兑换商品
	 */
	+(Apijf_doMakeJFOrder*) getApijf_doMakeJFOrder{
		return [[Apijf_doMakeJFOrder alloc ] init];
	}
	
	/**
	 * 1.3	查询我的订单 userkey
	 */
	+(Apijf_doQueryAllMyOrder*) getApijf_doQueryAllMyOrder{
		return [[Apijf_doQueryAllMyOrder alloc ] init];
	}
	
	/**
	 * 1.3	查询我的订单 userandcode
	 */
	+(Apijf_doQueryDetailByCode*) getApijf_doQueryDetailByCode{
		return [[Apijf_doQueryDetailByCode alloc ] init];
	}
	
	/**
	 * 1.3	查询我的订单 userandcode
	 */
	+(Apijf_doDeleteMyOrder*) getApijf_doDeleteMyOrder{
		return [[Apijf_doDeleteMyOrder alloc ] init];
	}
	
	/**
	 * 2.3	查询奖励兑换单 userkey
	 */
	+(Apijl_doQueryJlJE*) getApijl_doQueryJlJE{
		return [[Apijl_doQueryJlJE alloc ] init];
	}
	
	/**
	 * 2.4	门店确认兑换单 jlorder
	 */
	+(Apijl_doMaokeOrder*) getApijl_doMaokeOrder{
		return [[Apijl_doMaokeOrder alloc ] init];
	}
	
	/**
	 * 2.4	门店确认兑换单 userkey
	 */
	+(Apijl_doQueryMyjlOrder*) getApijl_doQueryMyjlOrder{
		return [[Apijl_doQueryMyjlOrder alloc ] init];
	}
	
	/**
	 * 2.3	查询奖励兑换单 userandcode
	 */
	+(Apijl_doSureMyOrder*) getApijl_doSureMyOrder{
		return [[Apijl_doSureMyOrder alloc ] init];
	}
	
	/**
	 * 2.5	删除奖励兑换单接口 userandcode
	 */
	+(Apijl_doDeleteMyOrder*) getApijl_doDeleteMyOrder{
		return [[Apijl_doDeleteMyOrder alloc ] init];
	}
	
	/**
	 * 2.5	读取总数
	 */
	+(ApidoQueryAllCountAndJE*) getApidoQueryAllCountAndJE{
		return [[ApidoQueryAllCountAndJE alloc ] init];
	}
	
	/**
	 * 2.5	读取总数 useryhkh
	 */
	+(ApidoAddYhkh*) getApidoAddYhkh{
		return [[ApidoAddYhkh alloc ] init];
	}
	
	/**
	 * 2.5	读取总数 userkeypwd
	 */
	+(ApidoUpdateMyPWD*) getApidoUpdateMyPWD{
		return [[ApidoUpdateMyPWD alloc ] init];
	}
	
	/**
	 * 登录-传入参数(UserInfo)
	 */
	+(ApiDoLogin*) getApiDoLogin{
		return [[ApiDoLogin alloc ] init];
	}
	
	/**
	 * 查查询库存-传入参数(UserKey)
	 */
	+(ApiDoQueryKc*) getApiDoQueryKc{
		return [[ApiDoQueryKc alloc ] init];
	}
	
	/**
	 * 查询门店-传入参数(UserKey)
	 */
	+(ApidoQueryMD*) getApidoQueryMD{
		return [[ApidoQueryMD alloc ] init];
	}
	
	/**
	 * 查询积分-传入参数(UserKey)
	 */
	+(ApidoQueryJdk*) getApidoQueryJdk{
		return [[ApidoQueryJdk alloc ] init];
	}
	
	/**
	 * 扫描-传入参数(Userxsck)
	 */
	+(ApidoXsck*) getApidoXsck{
		return [[ApidoXsck alloc ] init];
	}
	
	/**
	 * 扫描码查询商品信息 参数 UserMD
	 */
	+(ApidoQueryXjCK*) getApidoQueryXjCK{
		return [[ApidoQueryXjCK alloc ] init];
	}
	
	/**
	 * 扫描码查询商品信息 参数 UserMD
	 */
	+(ApidoQueryCKBySMM*) getApidoQueryCKBySMM{
		return [[ApidoQueryCKBySMM alloc ] init];
	}
	
	/**
	 * 扫描码查询商品信息 参数 UserMD
	 */
	+(Apijf_doQueryJdk*) getApijf_doQueryJdk{
		return [[Apijf_doQueryJdk alloc ] init];
	}
	
	/**
	 * 查询库存量 userkey
	 */
	+(ApidoQueryMonthXse*) getApidoQueryMonthXse{
		return [[ApidoQueryMonthXse alloc ] init];
	}
	
	/**
	 * 查询库存量 userkey
	 */
	+(ApidoQueryJFDetail*) getApidoQueryJFDetail{
		return [[ApidoQueryJFDetail alloc ] init];
	}
	
	/**
	 * 查询库存量 userkeya
	 */
	+(Apikcpd_sp*) getApikcpd_sp{
		return [[Apikcpd_sp alloc ] init];
	}
	
	/**
	 * 查询库存量 kupd
	 */
	+(Apikupd*) getApikupd{
		return [[Apikupd alloc ] init];
	}
	
	/**
	 * 查询门店信息
	 */
	+(ApidoqueryMyDetailMsg*) getApidoqueryMyDetailMsg{
		return [[ApidoqueryMyDetailMsg alloc ] init];
	}

@end
