//
//  ApiDoLogin
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   登录-传入参数(UserInfo)
*/

package com.mdx.store.data.proto.apis;

import android.content.Context;
import com.mdx.framework.server.api.ApiManager;
import com.mdx.framework.server.api.UpdateOne;


public class ApiDoLogin extends com.mdx.framework.server.api.ApiUpdate {


	/**
	 * 登录-传入参数(UserInfo)
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param usercode 用户名
	 * @param userpwd 密码
	 * @param mclass 分类 default com.shqj.webservice.entity.UserInfo
	 * @callback com.mdx.store.data.proto.Gongying.Login
	*/
	public UpdateOne get(Context context, Object parent, String method,String usercode,String userpwd,String mclass) {
		this.setMethod(method);
		this.setContext(context);
		this.setParent(parent);
		UpdateOne update = new UpdateOne("DoLogin", new String[][] { 
			{"usercode",usercode},
			{"userpwd",userpwd},
			{"class",mclass==null?"com.shqj.webservice.entity.UserInfo":mclass}
		  });
		return initUpdateOne(update);
	}

	/**
	 * 登录-传入参数(UserInfo)
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param usercode 用户名
	 * @param userpwd 密码
	 * @param mclass 分类 default com.shqj.webservice.entity.UserInfo
	 * @callback com.mdx.store.data.proto.Gongying.Login
	*/
	public UpdateOne load(Context context, Object parent, String method,String usercode,String userpwd,String mclass) {
		UpdateOne update=get(context, parent, method,usercode,userpwd,mclass);
		ApiManager.Load(getContext(), getParent(), new UpdateOne[] { update });
		return update;

	}

	/**
	 * 登录-传入参数(UserInfo)
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param usercode 用户名
	 * @param userpwd 密码
	 * @param mclass 分类 default com.shqj.webservice.entity.UserInfo
	 * @callback com.mdx.store.data.proto.Gongying.Login
	*/
	public ApiDoLogin set(String usercode,String userpwd,String mclass) {
		get(null,null,null,usercode,userpwd,mclass);
		return this;
	}



	/**
	 * 登录-传入参数(UserInfo)
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.Gongying.Login
	*/
	public UpdateOne get(Context context, Object parent, String method) {
		this.setMethod(method);
		this.setContext(context);
		this.setParent(parent);
		UpdateOne update = new UpdateOne("DoLogin", new String[][] { 
			{"class","com.shqj.webservice.entity.UserInfo"}
		 });
		return initUpdateOne(update);
	}

	/**
	 * 登录-传入参数(UserInfo)
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.Gongying.Login
	*/
	public UpdateOne load(Context context, Object parent, String method) {
		UpdateOne update=get(context, parent, method);
		ApiManager.Load(getContext(), getParent(), new UpdateOne[] { update });
		return update;

	}

	/**
	 * 登录-传入参数(UserInfo)
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.Gongying.Login
	*/
	public ApiDoLogin set() {
		get(null,null,null);
		return this;
	}


}
