//
//  ApidoAddYhkh
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   2.5	读取总数 useryhkh
*/

package com.mdx.store.data.proto.apis;

import android.content.Context;
import com.mdx.framework.server.api.ApiManager;
import com.mdx.framework.server.api.UpdateOne;


public class ApidoAddYhkh extends com.mdx.framework.server.api.ApiUpdate {


	/**
	 * 2.5	读取总数 useryhkh
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param mclass 分类 default com.shqj.webservice.entity.UserYHKH
	 * @param key 当前门店KEY
	 * @param khcity 当前门店KEY
	 * @param khsf 当前门店KEY
	 * @param psnname 当前门店KEY
	 * @param yhkh 当前门店KEY
	 * @callback com.mdx.store.data.proto.GongT.MakeJFOrder
	*/
	public UpdateOne get(Context context, Object parent, String method,String mclass,String key,String khcity,String khsf,String psnname,String yhkh) {
		this.setMethod(method);
		this.setContext(context);
		this.setParent(parent);
		UpdateOne update = new UpdateOne("doAddYhkh", new String[][] { 
			{"class",mclass==null?"com.shqj.webservice.entity.UserYHKH":mclass},
			{"key",key},
			{"khcity",khcity},
			{"khsf",khsf},
			{"psnname",psnname},
			{"yhkh",yhkh}
		  });
		return initUpdateOne(update);
	}

	/**
	 * 2.5	读取总数 useryhkh
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param mclass 分类 default com.shqj.webservice.entity.UserYHKH
	 * @param key 当前门店KEY
	 * @param khcity 当前门店KEY
	 * @param khsf 当前门店KEY
	 * @param psnname 当前门店KEY
	 * @param yhkh 当前门店KEY
	 * @callback com.mdx.store.data.proto.GongT.MakeJFOrder
	*/
	public UpdateOne load(Context context, Object parent, String method,String mclass,String key,String khcity,String khsf,String psnname,String yhkh) {
		UpdateOne update=get(context, parent, method,mclass,key,khcity,khsf,psnname,yhkh);
		ApiManager.Load(getContext(), getParent(), new UpdateOne[] { update });
		return update;

	}

	/**
	 * 2.5	读取总数 useryhkh
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param mclass 分类 default com.shqj.webservice.entity.UserYHKH
	 * @param key 当前门店KEY
	 * @param khcity 当前门店KEY
	 * @param khsf 当前门店KEY
	 * @param psnname 当前门店KEY
	 * @param yhkh 当前门店KEY
	 * @callback com.mdx.store.data.proto.GongT.MakeJFOrder
	*/
	public ApidoAddYhkh set(String mclass,String key,String khcity,String khsf,String psnname,String yhkh) {
		get(null,null,null,mclass,key,khcity,khsf,psnname,yhkh);
		return this;
	}



	/**
	 * 2.5	读取总数 useryhkh
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.GongT.MakeJFOrder
	*/
	public UpdateOne get(Context context, Object parent, String method) {
		this.setMethod(method);
		this.setContext(context);
		this.setParent(parent);
		UpdateOne update = new UpdateOne("doAddYhkh", new String[][] { 
			{"class","com.shqj.webservice.entity.UserYHKH"}
		 });
		return initUpdateOne(update);
	}

	/**
	 * 2.5	读取总数 useryhkh
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
	 * 2.5	读取总数 useryhkh
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.GongT.MakeJFOrder
	*/
	public ApidoAddYhkh set() {
		get(null,null,null);
		return this;
	}


}
