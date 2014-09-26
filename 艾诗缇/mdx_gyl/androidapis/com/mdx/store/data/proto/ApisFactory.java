//
//  ApisFactory
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   apis集合类
*/

package com.mdx.store.data.proto;


import com.mdx.store.data.proto.apis.Apijf_doQueryAllCanBackCP;
import com.mdx.store.data.proto.apis.Apijf_doMakeJFOrder;
import com.mdx.store.data.proto.apis.Apijf_doQueryAllMyOrder;
import com.mdx.store.data.proto.apis.Apijf_doQueryDetailByCode;
import com.mdx.store.data.proto.apis.Apijf_doDeleteMyOrder;
import com.mdx.store.data.proto.apis.Apijl_doQueryJlJE;
import com.mdx.store.data.proto.apis.Apijl_doMaokeOrder;
import com.mdx.store.data.proto.apis.Apijl_doQueryMyjlOrder;
import com.mdx.store.data.proto.apis.Apijl_doSureMyOrder;
import com.mdx.store.data.proto.apis.Apijl_doDeleteMyOrder;
import com.mdx.store.data.proto.apis.ApidoQueryAllCountAndJE;
import com.mdx.store.data.proto.apis.ApidoAddYhkh;
import com.mdx.store.data.proto.apis.ApidoUpdateMyPWD;
import com.mdx.store.data.proto.apis.ApiDoLogin;
import com.mdx.store.data.proto.apis.ApiDoQueryKc;
import com.mdx.store.data.proto.apis.ApidoQueryMD;
import com.mdx.store.data.proto.apis.ApidoQueryJdk;
import com.mdx.store.data.proto.apis.ApidoXsck;
import com.mdx.store.data.proto.apis.ApidoQueryXjCK;
import com.mdx.store.data.proto.apis.ApidoQueryCKBySMM;
import com.mdx.store.data.proto.apis.Apijf_doQueryJdk;
import com.mdx.store.data.proto.apis.ApidoQueryMonthXse;
import com.mdx.store.data.proto.apis.ApidoQueryJFDetail;
import com.mdx.store.data.proto.apis.Apikcpd_sp;
import com.mdx.store.data.proto.apis.Apikupd;
import com.mdx.store.data.proto.apis.ApidoqueryMyDetailMsg;

public class ApisFactory {


	
	/**
	 * 1.1	查询可以兑换商品
	 */
	public static Apijf_doQueryAllCanBackCP getApijf_doQueryAllCanBackCP(){
		return new Apijf_doQueryAllCanBackCP();
	}
	
	/**
	 * 1.1	查询可以兑换商品
	 */
	public static Apijf_doMakeJFOrder getApijf_doMakeJFOrder(){
		return new Apijf_doMakeJFOrder();
	}
	
	/**
	 * 1.3	查询我的订单 userkey
	 */
	public static Apijf_doQueryAllMyOrder getApijf_doQueryAllMyOrder(){
		return new Apijf_doQueryAllMyOrder();
	}
	
	/**
	 * 1.3	查询我的订单 userandcode
	 */
	public static Apijf_doQueryDetailByCode getApijf_doQueryDetailByCode(){
		return new Apijf_doQueryDetailByCode();
	}
	
	/**
	 * 1.3	查询我的订单 userandcode
	 */
	public static Apijf_doDeleteMyOrder getApijf_doDeleteMyOrder(){
		return new Apijf_doDeleteMyOrder();
	}
	
	/**
	 * 2.3	查询奖励兑换单 userkey
	 */
	public static Apijl_doQueryJlJE getApijl_doQueryJlJE(){
		return new Apijl_doQueryJlJE();
	}
	
	/**
	 * 2.4	门店确认兑换单 jlorder
	 */
	public static Apijl_doMaokeOrder getApijl_doMaokeOrder(){
		return new Apijl_doMaokeOrder();
	}
	
	/**
	 * 2.4	门店确认兑换单 userkey
	 */
	public static Apijl_doQueryMyjlOrder getApijl_doQueryMyjlOrder(){
		return new Apijl_doQueryMyjlOrder();
	}
	
	/**
	 * 2.3	查询奖励兑换单 userandcode
	 */
	public static Apijl_doSureMyOrder getApijl_doSureMyOrder(){
		return new Apijl_doSureMyOrder();
	}
	
	/**
	 * 2.5	删除奖励兑换单接口 userandcode
	 */
	public static Apijl_doDeleteMyOrder getApijl_doDeleteMyOrder(){
		return new Apijl_doDeleteMyOrder();
	}
	
	/**
	 * 2.5	读取总数
	 */
	public static ApidoQueryAllCountAndJE getApidoQueryAllCountAndJE(){
		return new ApidoQueryAllCountAndJE();
	}
	
	/**
	 * 2.5	读取总数 useryhkh
	 */
	public static ApidoAddYhkh getApidoAddYhkh(){
		return new ApidoAddYhkh();
	}
	
	/**
	 * 2.5	读取总数 userkeypwd
	 */
	public static ApidoUpdateMyPWD getApidoUpdateMyPWD(){
		return new ApidoUpdateMyPWD();
	}
	
	/**
	 * 登录-传入参数(UserInfo)
	 */
	public static ApiDoLogin getApiDoLogin(){
		return new ApiDoLogin();
	}
	
	/**
	 * 查查询库存-传入参数(UserKey)
	 */
	public static ApiDoQueryKc getApiDoQueryKc(){
		return new ApiDoQueryKc();
	}
	
	/**
	 * 查询门店-传入参数(UserKey)
	 */
	public static ApidoQueryMD getApidoQueryMD(){
		return new ApidoQueryMD();
	}
	
	/**
	 * 查询积分-传入参数(UserKey)
	 */
	public static ApidoQueryJdk getApidoQueryJdk(){
		return new ApidoQueryJdk();
	}
	
	/**
	 * 扫描-传入参数(Userxsck)
	 */
	public static ApidoXsck getApidoXsck(){
		return new ApidoXsck();
	}
	
	/**
	 * 扫描码查询商品信息 参数 UserMD
	 */
	public static ApidoQueryXjCK getApidoQueryXjCK(){
		return new ApidoQueryXjCK();
	}
	
	/**
	 * 扫描码查询商品信息 参数 UserMD
	 */
	public static ApidoQueryCKBySMM getApidoQueryCKBySMM(){
		return new ApidoQueryCKBySMM();
	}
	
	/**
	 * 扫描码查询商品信息 参数 UserMD
	 */
	public static Apijf_doQueryJdk getApijf_doQueryJdk(){
		return new Apijf_doQueryJdk();
	}
	
	/**
	 * 查询库存量 userkey
	 */
	public static ApidoQueryMonthXse getApidoQueryMonthXse(){
		return new ApidoQueryMonthXse();
	}
	
	/**
	 * 查询库存量 userkey
	 */
	public static ApidoQueryJFDetail getApidoQueryJFDetail(){
		return new ApidoQueryJFDetail();
	}
	
	/**
	 * 查询库存量 userkeya
	 */
	public static Apikcpd_sp getApikcpd_sp(){
		return new Apikcpd_sp();
	}
	
	/**
	 * 查询库存量 kupd
	 */
	public static Apikupd getApikupd(){
		return new Apikupd();
	}
	
	/**
	 * 查询门店信息
	 */
	public static ApidoqueryMyDetailMsg getApidoqueryMyDetailMsg(){
		return new ApidoqueryMyDetailMsg();
	}

}
