//
//  ApidoUpdateMyPWD
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   2.5	读取总数 userkeypwd
*/

package com.mdx.store.data.proto.apis;

import android.content.Context;
import com.mdx.framework.server.api.ApiManager;
import com.mdx.framework.server.api.UpdateOne;


public class ApidoUpdateMyPWD extends com.mdx.framework.server.api.ApiUpdate {


	/**
	 * 2.5	读取总数 userkeypwd
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param mclass 分类 default com.shqj.webservice.entity.UserKeyPwd
	 * @param key 当前门店KEY
	 * @param pwd 当前门店KEY
	 * @callback com.mdx.store.data.proto.GongT.MakeJFOrder
	*/
	public UpdateOne get(Context context, Object parent, String method,String mclass,String key,String pwd) {
		this.setMethod(method);
		this.setContext(context);
		this.setParent(parent);
		UpdateOne update = new UpdateOne("doUpdateMyPWD", new String[][] { 
			{"class",mclass==null?"com.shqj.webservice.entity.UserKeyPwd":mclass},
			{"key",key},
			{"pwd",pwd}
		  });
		return initUpdateOne(update);
	}

	/**
	 * 2.5	读取总数 userkeypwd
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param mclass 分类 default com.shqj.webservice.entity.UserKeyPwd
	 * @param key 当前门店KEY
	 * @param pwd 当前门店KEY
	 * @callback com.mdx.store.data.proto.GongT.MakeJFOrder
	*/
	public UpdateOne load(Context context, Object parent, String method,String mclass,String key,String pwd) {
		UpdateOne update=get(context, parent, method,mclass,key,pwd);
		ApiManager.Load(getContext(), getParent(), new UpdateOne[] { update });
		return update;

	}

	/**
	 * 2.5	读取总数 userkeypwd
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param mclass 分类 default com.shqj.webservice.entity.UserKeyPwd
	 * @param key 当前门店KEY
	 * @param pwd 当前门店KEY
	 * @callback com.mdx.store.data.proto.GongT.MakeJFOrder
	*/
	public ApidoUpdateMyPWD set(String mclass,String key,String pwd) {
		get(null,null,null,mclass,key,pwd);
		return this;
	}



	/**
	 * 2.5	读取总数 userkeypwd
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.GongT.MakeJFOrder
	*/
	public UpdateOne get(Context context, Object parent, String method) {
		this.setMethod(method);
		this.setContext(context);
		this.setParent(parent);
		UpdateOne update = new UpdateOne("doUpdateMyPWD", new String[][] { 
			{"class","com.shqj.webservice.entity.UserKeyPwd"}
		 });
		return initUpdateOne(update);
	}

	/**
	 * 2.5	读取总数 userkeypwd
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
	 * 2.5	读取总数 userkeypwd
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.GongT.MakeJFOrder
	*/
	public ApidoUpdateMyPWD set() {
		get(null,null,null);
		return this;
	}


}
