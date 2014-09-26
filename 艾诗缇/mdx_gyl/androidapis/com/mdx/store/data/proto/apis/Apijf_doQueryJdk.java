//
//  Apijf_doQueryJdk
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   扫描码查询商品信息 参数 UserMD
*/

package com.mdx.store.data.proto.apis;

import android.content.Context;
import com.mdx.framework.server.api.ApiManager;
import com.mdx.framework.server.api.UpdateOne;


public class Apijf_doQueryJdk extends com.mdx.framework.server.api.ApiUpdate {


	/**
	 * 扫描码查询商品信息 参数 UserMD
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param key 当前门店或代理商的key
	 * @param mclass 分类 default com.shqj.webservice.entity.UserKeyAndSMCode
	 * @param smcode 扫描码
	 * @callback com.mdx.store.data.proto.Gongying.QueryCKBySMMList
	*/
	public UpdateOne get(Context context, Object parent, String method,String key,String mclass,String smcode) {
		this.setMethod(method);
		this.setContext(context);
		this.setParent(parent);
		UpdateOne update = new UpdateOne("jf_doQueryJdk", new String[][] { 
			{"key",key},
			{"class",mclass==null?"com.shqj.webservice.entity.UserKeyAndSMCode":mclass},
			{"smcode",smcode}
		  });
		return initUpdateOne(update);
	}

	/**
	 * 扫描码查询商品信息 参数 UserMD
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param key 当前门店或代理商的key
	 * @param mclass 分类 default com.shqj.webservice.entity.UserKeyAndSMCode
	 * @param smcode 扫描码
	 * @callback com.mdx.store.data.proto.Gongying.QueryCKBySMMList
	*/
	public UpdateOne load(Context context, Object parent, String method,String key,String mclass,String smcode) {
		UpdateOne update=get(context, parent, method,key,mclass,smcode);
		ApiManager.Load(getContext(), getParent(), new UpdateOne[] { update });
		return update;

	}

	/**
	 * 扫描码查询商品信息 参数 UserMD
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param key 当前门店或代理商的key
	 * @param mclass 分类 default com.shqj.webservice.entity.UserKeyAndSMCode
	 * @param smcode 扫描码
	 * @callback com.mdx.store.data.proto.Gongying.QueryCKBySMMList
	*/
	public Apijf_doQueryJdk set(String key,String mclass,String smcode) {
		get(null,null,null,key,mclass,smcode);
		return this;
	}



	/**
	 * 扫描码查询商品信息 参数 UserMD
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.Gongying.QueryCKBySMMList
	*/
	public UpdateOne get(Context context, Object parent, String method) {
		this.setMethod(method);
		this.setContext(context);
		this.setParent(parent);
		UpdateOne update = new UpdateOne("jf_doQueryJdk", new String[][] { 
			{"class","com.shqj.webservice.entity.UserKeyAndSMCode"}
		 });
		return initUpdateOne(update);
	}

	/**
	 * 扫描码查询商品信息 参数 UserMD
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.Gongying.QueryCKBySMMList
	*/
	public UpdateOne load(Context context, Object parent, String method) {
		UpdateOne update=get(context, parent, method);
		ApiManager.Load(getContext(), getParent(), new UpdateOne[] { update });
		return update;

	}

	/**
	 * 扫描码查询商品信息 参数 UserMD
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.Gongying.QueryCKBySMMList
	*/
	public Apijf_doQueryJdk set() {
		get(null,null,null);
		return this;
	}


}
