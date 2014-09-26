//
//  Apijf_doQueryAllMyOrder
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   1.3	查询我的订单 userkey
*/

package com.mdx.store.data.proto.apis;

import android.content.Context;
import com.mdx.framework.server.api.ApiManager;
import com.mdx.framework.server.api.UpdateOne;


public class Apijf_doQueryAllMyOrder extends com.mdx.framework.server.api.ApiUpdate {


	/**
	 * 1.3	查询我的订单 userkey
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param mclass 分类 default com.shqj.webservice.entity.UserKey
	 * @param key 当前门店KEY
	 * @callback com.mdx.store.data.proto.GongT.QueryAllMyOrderList
	*/
	public UpdateOne get(Context context, Object parent, String method,String mclass,String key) {
		this.setMethod(method);
		this.setContext(context);
		this.setParent(parent);
		UpdateOne update = new UpdateOne("jf_doQueryAllMyOrder", new String[][] { 
			{"class",mclass==null?"com.shqj.webservice.entity.UserKey":mclass},
			{"key",key}
		  });
		return initUpdateOne(update);
	}

	/**
	 * 1.3	查询我的订单 userkey
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param mclass 分类 default com.shqj.webservice.entity.UserKey
	 * @param key 当前门店KEY
	 * @callback com.mdx.store.data.proto.GongT.QueryAllMyOrderList
	*/
	public UpdateOne load(Context context, Object parent, String method,String mclass,String key) {
		UpdateOne update=get(context, parent, method,mclass,key);
		ApiManager.Load(getContext(), getParent(), new UpdateOne[] { update });
		return update;

	}

	/**
	 * 1.3	查询我的订单 userkey
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param mclass 分类 default com.shqj.webservice.entity.UserKey
	 * @param key 当前门店KEY
	 * @callback com.mdx.store.data.proto.GongT.QueryAllMyOrderList
	*/
	public Apijf_doQueryAllMyOrder set(String mclass,String key) {
		get(null,null,null,mclass,key);
		return this;
	}



	/**
	 * 1.3	查询我的订单 userkey
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.GongT.QueryAllMyOrderList
	*/
	public UpdateOne get(Context context, Object parent, String method) {
		this.setMethod(method);
		this.setContext(context);
		this.setParent(parent);
		UpdateOne update = new UpdateOne("jf_doQueryAllMyOrder", new String[][] { 
			{"class","com.shqj.webservice.entity.UserKey"}
		 });
		return initUpdateOne(update);
	}

	/**
	 * 1.3	查询我的订单 userkey
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.GongT.QueryAllMyOrderList
	*/
	public UpdateOne load(Context context, Object parent, String method) {
		UpdateOne update=get(context, parent, method);
		ApiManager.Load(getContext(), getParent(), new UpdateOne[] { update });
		return update;

	}

	/**
	 * 1.3	查询我的订单 userkey
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.GongT.QueryAllMyOrderList
	*/
	public Apijf_doQueryAllMyOrder set() {
		get(null,null,null);
		return this;
	}


}
