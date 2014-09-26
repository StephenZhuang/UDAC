//
//  ApidoQueryJdk
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   查询积分-传入参数(UserKey)
*/

package com.mdx.store.data.proto.apis;

import android.content.Context;
import com.mdx.framework.server.api.ApiManager;
import com.mdx.framework.server.api.UpdateOne;


public class ApidoQueryJdk extends com.mdx.framework.server.api.ApiUpdate {


	/**
	 * 查询积分-传入参数(UserKey)
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param key 当前门店或代理商的key
	 * @param mclass 分类 default com.shqj.webservice.entity.UserKey
	 * @callback com.mdx.store.data.proto.Gongying.QueryJdkList
	*/
	public UpdateOne get(Context context, Object parent, String method,String key,String mclass) {
		this.setMethod(method);
		this.setContext(context);
		this.setParent(parent);
		UpdateOne update = new UpdateOne("doQueryJdk", new String[][] { 
			{"key",key},
			{"class",mclass==null?"com.shqj.webservice.entity.UserKey":mclass}
		  });
		return initUpdateOne(update);
	}

	/**
	 * 查询积分-传入参数(UserKey)
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param key 当前门店或代理商的key
	 * @param mclass 分类 default com.shqj.webservice.entity.UserKey
	 * @callback com.mdx.store.data.proto.Gongying.QueryJdkList
	*/
	public UpdateOne load(Context context, Object parent, String method,String key,String mclass) {
		UpdateOne update=get(context, parent, method,key,mclass);
		ApiManager.Load(getContext(), getParent(), new UpdateOne[] { update });
		return update;

	}

	/**
	 * 查询积分-传入参数(UserKey)
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param key 当前门店或代理商的key
	 * @param mclass 分类 default com.shqj.webservice.entity.UserKey
	 * @callback com.mdx.store.data.proto.Gongying.QueryJdkList
	*/
	public ApidoQueryJdk set(String key,String mclass) {
		get(null,null,null,key,mclass);
		return this;
	}



	/**
	 * 查询积分-传入参数(UserKey)
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.Gongying.QueryJdkList
	*/
	public UpdateOne get(Context context, Object parent, String method) {
		this.setMethod(method);
		this.setContext(context);
		this.setParent(parent);
		UpdateOne update = new UpdateOne("doQueryJdk", new String[][] { 
			{"class","com.shqj.webservice.entity.UserKey"}
		 });
		return initUpdateOne(update);
	}

	/**
	 * 查询积分-传入参数(UserKey)
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.Gongying.QueryJdkList
	*/
	public UpdateOne load(Context context, Object parent, String method) {
		UpdateOne update=get(context, parent, method);
		ApiManager.Load(getContext(), getParent(), new UpdateOne[] { update });
		return update;

	}

	/**
	 * 查询积分-传入参数(UserKey)
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.Gongying.QueryJdkList
	*/
	public ApidoQueryJdk set() {
		get(null,null,null);
		return this;
	}


}
