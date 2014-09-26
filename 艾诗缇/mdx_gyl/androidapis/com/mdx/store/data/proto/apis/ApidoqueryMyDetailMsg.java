//
//  ApidoqueryMyDetailMsg
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   查询门店信息
*/

package com.mdx.store.data.proto.apis;

import android.content.Context;
import com.mdx.framework.server.api.ApiManager;
import com.mdx.framework.server.api.UpdateOne;


public class ApidoqueryMyDetailMsg extends com.mdx.framework.server.api.ApiUpdate {


	/**
	 * 查询门店信息
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param key null
	 * @callback com.mdx.store.data.proto.Gongying.MDXX
	*/
	public UpdateOne get(Context context, Object parent, String method,String key) {
		this.setMethod(method);
		this.setContext(context);
		this.setParent(parent);
		UpdateOne update = new UpdateOne("doqueryMyDetailMsg", new String[][] { 
			{"key",key}
		  });
		return initUpdateOne(update);
	}

	/**
	 * 查询门店信息
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param key null
	 * @callback com.mdx.store.data.proto.Gongying.MDXX
	*/
	public UpdateOne load(Context context, Object parent, String method,String key) {
		UpdateOne update=get(context, parent, method,key);
		ApiManager.Load(getContext(), getParent(), new UpdateOne[] { update });
		return update;

	}

	/**
	 * 查询门店信息
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param key null
	 * @callback com.mdx.store.data.proto.Gongying.MDXX
	*/
	public ApidoqueryMyDetailMsg set(String key) {
		get(null,null,null,key);
		return this;
	}



	/**
	 * 查询门店信息
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.Gongying.MDXX
	*/
	public UpdateOne get(Context context, Object parent, String method) {
		this.setMethod(method);
		this.setContext(context);
		this.setParent(parent);
		UpdateOne update = new UpdateOne("doqueryMyDetailMsg", new String[][] { 
		 });
		return initUpdateOne(update);
	}

	/**
	 * 查询门店信息
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.Gongying.MDXX
	*/
	public UpdateOne load(Context context, Object parent, String method) {
		UpdateOne update=get(context, parent, method);
		ApiManager.Load(getContext(), getParent(), new UpdateOne[] { update });
		return update;

	}

	/**
	 * 查询门店信息
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.Gongying.MDXX
	*/
	public ApidoqueryMyDetailMsg set() {
		get(null,null,null);
		return this;
	}


}
