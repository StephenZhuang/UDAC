//
//  ApidoXsck
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   扫描-传入参数(Userxsck)
*/

package com.mdx.store.data.proto.apis;

import android.content.Context;
import com.mdx.framework.server.api.ApiManager;
import com.mdx.framework.server.api.UpdateOne;


public class ApidoXsck extends com.mdx.framework.server.api.ApiUpdate {


	/**
	 * 扫描-传入参数(Userxsck)
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param key 当前扫描人对应的KEY
	 * @param mclass 分类 default com.shqj.webservice.entity.Userxsck
	 * @param mdkey 1.门店key，如果当前是代理商，这里就必须带有门店的key，这样后台才能知道，代理商的商品是卖给谁的 2. 如果当前人是门店，这里就随便写一个就行了
	 * @param isth 如果当前是门店，并且是退货扫描，这里要填写Y，如果是其他扫描，则不用写任何东西
	 * @param smcode 扫描时候对应的扫描码
	 * @callback com.mdx.store.data.proto.Gongying.Xsck
	*/
	public UpdateOne get(Context context, Object parent, String method,String key,String mclass,String mdkey,String isth,String smcode) {
		this.setMethod(method);
		this.setContext(context);
		this.setParent(parent);
		UpdateOne update = new UpdateOne("doXsck", new String[][] { 
			{"key",key},
			{"class",mclass==null?"com.shqj.webservice.entity.Userxsck":mclass},
			{"mdkey",mdkey},
			{"isth",isth},
			{"smcode",smcode}
		  });
		return initUpdateOne(update);
	}

	/**
	 * 扫描-传入参数(Userxsck)
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param key 当前扫描人对应的KEY
	 * @param mclass 分类 default com.shqj.webservice.entity.Userxsck
	 * @param mdkey 1.门店key，如果当前是代理商，这里就必须带有门店的key，这样后台才能知道，代理商的商品是卖给谁的 2. 如果当前人是门店，这里就随便写一个就行了
	 * @param isth 如果当前是门店，并且是退货扫描，这里要填写Y，如果是其他扫描，则不用写任何东西
	 * @param smcode 扫描时候对应的扫描码
	 * @callback com.mdx.store.data.proto.Gongying.Xsck
	*/
	public UpdateOne load(Context context, Object parent, String method,String key,String mclass,String mdkey,String isth,String smcode) {
		UpdateOne update=get(context, parent, method,key,mclass,mdkey,isth,smcode);
		ApiManager.Load(getContext(), getParent(), new UpdateOne[] { update });
		return update;

	}

	/**
	 * 扫描-传入参数(Userxsck)
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @param key 当前扫描人对应的KEY
	 * @param mclass 分类 default com.shqj.webservice.entity.Userxsck
	 * @param mdkey 1.门店key，如果当前是代理商，这里就必须带有门店的key，这样后台才能知道，代理商的商品是卖给谁的 2. 如果当前人是门店，这里就随便写一个就行了
	 * @param isth 如果当前是门店，并且是退货扫描，这里要填写Y，如果是其他扫描，则不用写任何东西
	 * @param smcode 扫描时候对应的扫描码
	 * @callback com.mdx.store.data.proto.Gongying.Xsck
	*/
	public ApidoXsck set(String key,String mclass,String mdkey,String isth,String smcode) {
		get(null,null,null,key,mclass,mdkey,isth,smcode);
		return this;
	}



	/**
	 * 扫描-传入参数(Userxsck)
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.Gongying.Xsck
	*/
	public UpdateOne get(Context context, Object parent, String method) {
		this.setMethod(method);
		this.setContext(context);
		this.setParent(parent);
		UpdateOne update = new UpdateOne("doXsck", new String[][] { 
			{"class","com.shqj.webservice.entity.Userxsck"}
		 });
		return initUpdateOne(update);
	}

	/**
	 * 扫描-传入参数(Userxsck)
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.Gongying.Xsck
	*/
	public UpdateOne load(Context context, Object parent, String method) {
		UpdateOne update=get(context, parent, method);
		ApiManager.Load(getContext(), getParent(), new UpdateOne[] { update });
		return update;

	}

	/**
	 * 扫描-传入参数(Userxsck)
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.Gongying.Xsck
	*/
	public ApidoXsck set() {
		get(null,null,null);
		return this;
	}


}
