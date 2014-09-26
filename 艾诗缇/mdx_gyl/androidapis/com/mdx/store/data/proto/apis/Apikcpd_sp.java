//
//  Apikcpd_sp
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   查询库存量 userkeya
*/

package com.mdx.store.data.proto.apis;

import android.content.Context;
import com.mdx.framework.server.api.ApiManager;
import com.mdx.framework.server.api.UpdateOne;


public class Apikcpd_sp extends com.mdx.framework.server.api.ApiUpdate {


	/**
	 * 查询库存量 userkeya
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.Gongying.KcpdSpList
	*/
	public UpdateOne get(Context context, Object parent, String method) {
		this.setMethod(method);
		this.setContext(context);
		this.setParent(parent);
		UpdateOne update = new UpdateOne("kcpd_sp", new String[][] { 
		  });
		return initUpdateOne(update);
	}

	/**
	 * 查询库存量 userkeya
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.Gongying.KcpdSpList
	*/
	public UpdateOne load(Context context, Object parent, String method) {
		UpdateOne update=get(context, parent, method);
		ApiManager.Load(getContext(), getParent(), new UpdateOne[] { update });
		return update;

	}

	/**
	 * 查询库存量 userkeya
	 * @param context 上下文
	 * @param parent  调用接口实体
	 * @param method  返回到哪个方法
	 * @callback com.mdx.store.data.proto.Gongying.KcpdSpList
	*/
	public Apikcpd_sp set() {
		get(null,null,null);
		return this;
	}


}
