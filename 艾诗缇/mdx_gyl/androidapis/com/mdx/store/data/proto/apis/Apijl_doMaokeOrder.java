//
//  Apijl_doMaokeOrder
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   2.4	门店确认兑换单 jlorder
*/

package com.mdx.store.data.proto.apis;

import android.content.Context;
import com.mdx.framework.server.api.ApiManager;
import com.mdx.framework.server.api.UpdateOne;


public class Apijl_doMaokeOrder extends com.mdx.framework.server.api.ApiUpdate {


	/**
	 * 2.4	门店确认兑换单 jlorder
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param mclass 分类 default com.shqj.webservice.entity.JLDHOrder
	 * @param dcount 要兑换的奖励金额
	 * @param pk_key 当前门店KEY
	 * @callback com.mdx.store.data.proto.GongT.MakeJFOrder
	*/
	public UpdateOne get(Context context, Object parent, String method,String mclass,String dcount,String pk_key) {
		this.setMethod(method);
		this.setContext(context);
		this.setParent(parent);
		UpdateOne update = new UpdateOne("jl_doMaokeOrder", new String[][] { 
			{"class",mclass==null?"com.shqj.webservice.entity.JLDHOrder":mclass},
			{"dcount",dcount},
			{"pk_key",pk_key}
		  });
		return initUpdateOne(update);
	}

	/**
	 * 2.4	门店确认兑换单 jlorder
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param mclass 分类 default com.shqj.webservice.entity.JLDHOrder
	 * @param dcount 要兑换的奖励金额
	 * @param pk_key 当前门店KEY
	 * @callback com.mdx.store.data.proto.GongT.MakeJFOrder
	*/
	public UpdateOne load(Context context, Object parent, String method,String mclass,String dcount,String pk_key) {
		UpdateOne update=get(context, parent, method,mclass,dcount,pk_key);
		ApiManager.Load(getContext(), getParent(), new UpdateOne[] { update });
		return update;

	}

	/**
	 * 2.4	门店确认兑换单 jlorder
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param mclass 分类 default com.shqj.webservice.entity.JLDHOrder
	 * @param dcount 要兑换的奖励金额
	 * @param pk_key 当前门店KEY
	 * @callback com.mdx.store.data.proto.GongT.MakeJFOrder
	*/
	public Apijl_doMaokeOrder set(String mclass,String dcount,String pk_key) {
		get(null,null,null,mclass,dcount,pk_key);
		return this;
	}



	/**
	 * 2.4	门店确认兑换单 jlorder
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.GongT.MakeJFOrder
	*/
	public UpdateOne get(Context context, Object parent, String method) {
		this.setMethod(method);
		this.setContext(context);
		this.setParent(parent);
		UpdateOne update = new UpdateOne("jl_doMaokeOrder", new String[][] { 
			{"class","com.shqj.webservice.entity.JLDHOrder"}
		 });
		return initUpdateOne(update);
	}

	/**
	 * 2.4	门店确认兑换单 jlorder
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
	 * 2.4	门店确认兑换单 jlorder
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.GongT.MakeJFOrder
	*/
	public Apijl_doMaokeOrder set() {
		get(null,null,null);
		return this;
	}


}
