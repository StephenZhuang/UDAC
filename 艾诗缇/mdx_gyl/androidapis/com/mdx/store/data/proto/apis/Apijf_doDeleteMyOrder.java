//
//  Apijf_doDeleteMyOrder
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   1.3	查询我的订单 userandcode
*/

package com.mdx.store.data.proto.apis;

import android.content.Context;
import com.mdx.framework.server.api.ApiManager;
import com.mdx.framework.server.api.UpdateOne;


public class Apijf_doDeleteMyOrder extends com.mdx.framework.server.api.ApiUpdate {


	/**
	 * 1.3	查询我的订单 userandcode
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param mclass 分类 default com.shqj.webservice.entity.UserKeyAndOrderCode
	 * @param key 当前门店KEY
	 * @param billcode 订单号
	 * @callback com.mdx.store.data.proto.GongT.MakeJFOrder
	*/
	public UpdateOne get(Context context, Object parent, String method,String mclass,String key,String billcode) {
		this.setMethod(method);
		this.setContext(context);
		this.setParent(parent);
		UpdateOne update = new UpdateOne("jf_doDeleteMyOrder", new String[][] { 
			{"class",mclass==null?"com.shqj.webservice.entity.UserKeyAndOrderCode":mclass},
			{"key",key},
			{"billcode",billcode}
		  });
		return initUpdateOne(update);
	}

	/**
	 * 1.3	查询我的订单 userandcode
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param mclass 分类 default com.shqj.webservice.entity.UserKeyAndOrderCode
	 * @param key 当前门店KEY
	 * @param billcode 订单号
	 * @callback com.mdx.store.data.proto.GongT.MakeJFOrder
	*/
	public UpdateOne load(Context context, Object parent, String method,String mclass,String key,String billcode) {
		UpdateOne update=get(context, parent, method,mclass,key,billcode);
		ApiManager.Load(getContext(), getParent(), new UpdateOne[] { update });
		return update;

	}

	/**
	 * 1.3	查询我的订单 userandcode
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param mclass 分类 default com.shqj.webservice.entity.UserKeyAndOrderCode
	 * @param key 当前门店KEY
	 * @param billcode 订单号
	 * @callback com.mdx.store.data.proto.GongT.MakeJFOrder
	*/
	public Apijf_doDeleteMyOrder set(String mclass,String key,String billcode) {
		get(null,null,null,mclass,key,billcode);
		return this;
	}



	/**
	 * 1.3	查询我的订单 userandcode
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.GongT.MakeJFOrder
	*/
	public UpdateOne get(Context context, Object parent, String method) {
		this.setMethod(method);
		this.setContext(context);
		this.setParent(parent);
		UpdateOne update = new UpdateOne("jf_doDeleteMyOrder", new String[][] { 
			{"class","com.shqj.webservice.entity.UserKeyAndOrderCode"}
		 });
		return initUpdateOne(update);
	}

	/**
	 * 1.3	查询我的订单 userandcode
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.GongT.MakeJFOrder
	*/
	public UpdateOne load(Context context, Object parent, String method) {
		UpdateOne update=get(context, parent, method);
		ApiManager.Load(getContext(), getParent(), new UpdateOne[] { update });
		return update;

	}

	/**
	 * 1.3	查询我的订单 userandcode
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.GongT.MakeJFOrder
	*/
	public Apijf_doDeleteMyOrder set() {
		get(null,null,null);
		return this;
	}


}
