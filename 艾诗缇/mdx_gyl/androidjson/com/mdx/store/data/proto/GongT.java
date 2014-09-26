//
//  GongT
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.


/**
   
*/

package com.mdx.store.data.proto;

import com.mdx.framework.server.api.json.JsonData;
import org.json.JSONObject;

import java.util.List;
import java.util.ArrayList;


public class GongT {


	/***** 查询库存-返回参数(UserccReturn) *****/
	public static class QueryAllCanBackCPList extends JsonData{
		private static final long serialVersionUID = 1L;

		public List<com.mdx.store.data.proto.GongT.QueryAllCanBackCP > data=new ArrayList<com.mdx.store.data.proto.GongT.QueryAllCanBackCP > (); //评论列表

		public QueryAllCanBackCPList() throws Exception {
		}

		public QueryAllCanBackCPList(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			getJsonArray(json, "data", com.mdx.store.data.proto.GongT.QueryAllCanBackCP .class, data); //评论列表
		}

	}

	/*****  *****/
	public static class QueryJlJE extends JsonData{
		private static final long serialVersionUID = 1L;

		public String allje; //累计奖励额度
		public String dhje; //兑换额度
		public String ffe; //发放金额
		public String yue; //余额 

		public QueryJlJE() throws Exception {
		}

		public QueryJlJE(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			allje= getJsonString(json,"allje"); //累计奖励额度
			dhje= getJsonString(json,"dhje"); //兑换额度
			ffe= getJsonString(json,"ffe"); //发放金额
			yue= getJsonString(json,"yue"); //余额 
		}

	}

	/***** 查询库存-返回参数(UserccReturn) *****/
	public static class QueryAllMyOrderList extends JsonData{
		private static final long serialVersionUID = 1L;

		public List<com.mdx.store.data.proto.GongT.QueryAllMyOrder > data=new ArrayList<com.mdx.store.data.proto.GongT.QueryAllMyOrder > (); //评论列表

		public QueryAllMyOrderList() throws Exception {
		}

		public QueryAllMyOrderList(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			getJsonArray(json, "data", com.mdx.store.data.proto.GongT.QueryAllMyOrder .class, data); //评论列表
		}

	}

	/*****  *****/
	public static class QueryDetailByCode extends JsonData{
		private static final long serialVersionUID = 1L;

		public String cpcode; //商品编码
		public String cpname; //商品名称
		public String cpcount; //商品数量
		public String cpprice; //商品单价
		public String allprice; //商品总额

		public QueryDetailByCode() throws Exception {
		}

		public QueryDetailByCode(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			cpcode= getJsonString(json,"cpcode"); //商品编码
			cpname= getJsonString(json,"cpname"); //商品名称
			cpcount= getJsonString(json,"cpcount"); //商品数量
			cpprice= getJsonString(json,"cpprice"); //商品单价
			allprice= getJsonString(json,"allprice"); //商品总额
		}

	}

	/***** 查询库存-返回参数(UserccReturn) *****/
	public static class QueryAllMyJLOrderList extends JsonData{
		private static final long serialVersionUID = 1L;

		public List<com.mdx.store.data.proto.GongT.QueryAllMyJLOrder > data=new ArrayList<com.mdx.store.data.proto.GongT.QueryAllMyJLOrder > (); //评论列表

		public QueryAllMyJLOrderList() throws Exception {
		}

		public QueryAllMyJLOrderList(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			getJsonArray(json, "data", com.mdx.store.data.proto.GongT.QueryAllMyJLOrder .class, data); //评论列表
		}

	}

	/*****  *****/
	public static class QueryJlJECount extends JsonData{
		private static final long serialVersionUID = 1L;

		public String je; //代表总额
		public String kccount; //代表总数量 

		public QueryJlJECount() throws Exception {
		}

		public QueryJlJECount(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			je= getJsonString(json,"je"); //代表总额
			kccount= getJsonString(json,"kccount"); //代表总数量 
		}

	}

	/*****  *****/
	public static class MakeJFOrder extends JsonData{
		private static final long serialVersionUID = 1L;

		public String retuenmsg; //对应的失败或者成功信息，成功的时候也要提示信息s
		public String returntype; //1 代表成功 2 代表失败
		public String mclass; //商品名称

		public MakeJFOrder() throws Exception {
		}

		public MakeJFOrder(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			retuenmsg= getJsonString(json,"retuenmsg"); //对应的失败或者成功信息，成功的时候也要提示信息s
			returntype= getJsonString(json,"returntype"); //1 代表成功 2 代表失败
			mclass= getJsonString(json,"class"); //商品名称
		}

	}

	/*****  *****/
	public static class QueryAllMyOrder extends JsonData{
		private static final long serialVersionUID = 1L;

		public String allcount; //总数
		public String allprice; //总额
		public String appdate; //审批日期
		public String appstatus; //发货状态
		public String backdate; //兑换日期
		public String mclass;
		public String connectaddr; //联系地址
		public String connectman; //联系人
		public String connectmoblie; // 联系电话
		public String dbillcode; //单据号
		public String sendcode; //货运单号 
		public String sendcorp; //发货公司
		public String senddate; //发货日期
		public String sendstatus; //发货状态
		public String cpcode; //商品编码
		public String cpname; //商品名称
		public String cpcount; //商品数量
		public String cpprice; //商品单价
		public String allprice; //商品单价
		public String sendcount; //发放金额
		public String surestatus; //确认状态
		public String suredate; //确认日期

		public QueryAllMyOrder() throws Exception {
		}

		public QueryAllMyOrder(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			allcount= getJsonString(json,"allcount"); //总数
			allprice= getJsonString(json,"allprice"); //总额
			appdate= getJsonString(json,"appdate"); //审批日期
			appstatus= getJsonString(json,"appstatus"); //发货状态
			backdate= getJsonString(json,"backdate"); //兑换日期
			mclass= getJsonString(json,"class");
			connectaddr= getJsonString(json,"connectaddr"); //联系地址
			connectman= getJsonString(json,"connectman"); //联系人
			connectmoblie= getJsonString(json,"connectmoblie"); // 联系电话
			dbillcode= getJsonString(json,"dbillcode"); //单据号
			sendcode= getJsonString(json,"sendcode"); //货运单号 
			sendcorp= getJsonString(json,"sendcorp"); //发货公司
			senddate= getJsonString(json,"senddate"); //发货日期
			sendstatus= getJsonString(json,"sendstatus"); //发货状态
			cpcode= getJsonString(json,"cpcode"); //商品编码
			cpname= getJsonString(json,"cpname"); //商品名称
			cpcount= getJsonString(json,"cpcount"); //商品数量
			cpprice= getJsonString(json,"cpprice"); //商品单价
			allprice= getJsonString(json,"allprice"); //商品单价
			sendcount= getJsonString(json,"sendcount"); //发放金额
			surestatus= getJsonString(json,"surestatus"); //确认状态
			suredate= getJsonString(json,"suredate"); //确认日期
		}

	}

	/*****  *****/
	public static class QueryAllMyJLOrder extends JsonData{
		private static final long serialVersionUID = 1L;

		public String dbillcode; //总数
		public String allcount; //总额
		public String backdate; //审批日期
		public String appstatus; //发货状态
		public String appdate; //兑换日期
		public String sendstatus;
		public String senddate; //联系地址
		public String sendcount; //联系人
		public String surestatus; // 联系电话
		public String suredate; //货运单号 

		public QueryAllMyJLOrder() throws Exception {
		}

		public QueryAllMyJLOrder(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			dbillcode= getJsonString(json,"dbillcode"); //总数
			allcount= getJsonString(json,"allcount"); //总额
			backdate= getJsonString(json,"backdate"); //审批日期
			appstatus= getJsonString(json,"appstatus"); //发货状态
			appdate= getJsonString(json,"appdate"); //兑换日期
			sendstatus= getJsonString(json,"sendstatus");
			senddate= getJsonString(json,"senddate"); //联系地址
			sendcount= getJsonString(json,"sendcount"); //联系人
			surestatus= getJsonString(json,"surestatus"); // 联系电话
			suredate= getJsonString(json,"suredate"); //货运单号 
		}

	}

	/*****  *****/
	public static class QueryAllCanBackCP extends JsonData{
		private static final long serialVersionUID = 1L;

		public String mclass; //固定不用管
		public String cpcode; //商品编码
		public String cpname; //商品名称
		public String pk_cpkey; //产品Key
		public String cpprice; //产品单价

		public QueryAllCanBackCP() throws Exception {
		}

		public QueryAllCanBackCP(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			mclass= getJsonString(json,"class"); //固定不用管
			cpcode= getJsonString(json,"cpcode"); //商品编码
			cpname= getJsonString(json,"cpname"); //商品名称
			pk_cpkey= getJsonString(json,"pk_cpkey"); //产品Key
			cpprice= getJsonString(json,"cpprice"); //产品单价
		}

	}

	/***** 查询库存-返回参数(UserccReturn) *****/
	public static class QueryDetailByCodeList extends JsonData{
		private static final long serialVersionUID = 1L;

		public List<com.mdx.store.data.proto.GongT.QueryAllMyOrder > data=new ArrayList<com.mdx.store.data.proto.GongT.QueryAllMyOrder > (); //评论列表

		public QueryDetailByCodeList() throws Exception {
		}

		public QueryDetailByCodeList(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			getJsonArray(json, "data", com.mdx.store.data.proto.GongT.QueryAllMyOrder .class, data); //评论列表
		}

	}


}
