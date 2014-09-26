//
//  Apijf_doMakeJFOrder
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   1.1	查询可以兑换商品
*/

package com.mdx.store.data.proto.apis;

import android.content.Context;
import com.mdx.framework.server.api.ApiManager;
import com.mdx.framework.server.api.UpdateOne;


public class Apijf_doMakeJFOrder extends com.mdx.framework.server.api.ApiUpdate {


	/**
	 * 1.1	查询可以兑换商品
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param jforder 传递参数:[{"class":"com.shqj.webservice.entity.JFBackOrder","count":12,"pk_cpkey":"商品KEY","pk_key":"门店KEY”}]
	 * @callback com.mdx.store.data.proto.GongT.MakeJFOrder
	*/
	public UpdateOne get(Context context, Object parent, String method,String jforder) {
		this.setMethod(method);
		this.setContext(context);
		this.setParent(parent);
		UpdateOne update = new UpdateOne("jf_doMakeJFOrder", new String[][] { 
			{"jforder",jforder}
		  });
		return initUpdateOne(update);
	}

	/**
	 * 1.1	查询可以兑换商品
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param jforder 传递参数:[{"class":"com.shqj.webservice.entity.JFBackOrder","count":12,"pk_cpkey":"商品KEY","pk_key":"门店KEY”}]
	 * @callback com.mdx.store.data.proto.GongT.MakeJFOrder
	*/
	public UpdateOne load(Context context, Object parent, String method,String jforder) {
		UpdateOne update=get(context, parent, method,jforder);
		ApiManager.Load(getContext(), getParent(), new UpdateOne[] { update });
		return update;

	}

	/**
	 * 1.1	查询可以兑换商品
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param jforder 传递参数:[{"class":"com.shqj.webservice.entity.JFBackOrder","count":12,"pk_cpkey":"商品KEY","pk_key":"门店KEY”}]
	 * @callback com.mdx.store.data.proto.GongT.MakeJFOrder
	*/
	public Apijf_doMakeJFOrder set(String jforder) {
		get(null,null,null,jforder);
		return this;
	}



	/**
	 * 1.1	查询可以兑换商品
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.GongT.MakeJFOrder
	*/
	public UpdateOne get(Context context, Object parent, String method) {
		this.setMethod(method);
		this.setContext(context);
		this.setParent(parent);
		UpdateOne update = new UpdateOne("jf_doMakeJFOrder", new String[][] { 
		 });
		return initUpdateOne(update);
	}

	/**
	 * 1.1	查询可以兑换商品
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
	 * 1.1	查询可以兑换商品
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.GongT.MakeJFOrder
	*/
	public Apijf_doMakeJFOrder set() {
		get(null,null,null);
		return this;
	}


}
