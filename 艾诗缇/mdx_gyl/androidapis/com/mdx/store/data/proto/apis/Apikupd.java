//
//  Apikupd
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   查询库存量 kupd
*/

package com.mdx.store.data.proto.apis;

import android.content.Context;
import com.mdx.framework.server.api.ApiManager;
import com.mdx.framework.server.api.UpdateOne;


public class Apikupd extends com.mdx.framework.server.api.ApiUpdate {


	/**
	 * 查询库存量 kupd
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param kupd null
	 * @callback com.mdx.store.data.proto.Gongying.KupdList
	*/
	public UpdateOne get(Context context, Object parent, String method,String kupd) {
		this.setMethod(method);
		this.setContext(context);
		this.setParent(parent);
		UpdateOne update = new UpdateOne("kupd", new String[][] { 
			{"kupd",kupd}
		  });
		return initUpdateOne(update);
	}

	/**
	 * 查询库存量 kupd
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param kupd null
	 * @callback com.mdx.store.data.proto.Gongying.KupdList
	*/
	public UpdateOne load(Context context, Object parent, String method,String kupd) {
		UpdateOne update=get(context, parent, method,kupd);
		ApiManager.Load(getContext(), getParent(), new UpdateOne[] { update });
		return update;

	}

	/**
	 * 查询库存量 kupd
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param kupd null
	 * @callback com.mdx.store.data.proto.Gongying.KupdList
	*/
	public Apikupd set(String kupd) {
		get(null,null,null,kupd);
		return this;
	}



	/**
	 * 查询库存量 kupd
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.Gongying.KupdList
	*/
	public UpdateOne get(Context context, Object parent, String method) {
		this.setMethod(method);
		this.setContext(context);
		this.setParent(parent);
		UpdateOne update = new UpdateOne("kupd", new String[][] { 
		 });
		return initUpdateOne(update);
	}

	/**
	 * 查询库存量 kupd
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.Gongying.KupdList
	*/
	public UpdateOne load(Context context, Object parent, String method) {
		UpdateOne update=get(context, parent, method);
		ApiManager.Load(getContext(), getParent(), new UpdateOne[] { update });
		return update;

	}

	/**
	 * 查询库存量 kupd
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.Gongying.KupdList
	*/
	public Apikupd set() {
		get(null,null,null);
		return this;
	}


}
