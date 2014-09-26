//
//  Gongying
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


public class Gongying {


	/***** 参数UserJF *****/
	public static class QueryJdk extends JsonData{
		private static final long serialVersionUID = 1L;

		public String mclass; //固定不用管
		public String jf; //积分
		public String jfbak; //已兑换积分
		public String rq; //日期
		public String yue; //余额

		public QueryJdk() throws Exception {
		}

		public QueryJdk(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			mclass= getJsonString(json,"class"); //固定不用管
			jf= getJsonString(json,"jf"); //积分
			jfbak= getJsonString(json,"jfbak"); //已兑换积分
			rq= getJsonString(json,"rq"); //日期
			yue= getJsonString(json,"yue"); //余额
		}

	}

	/***** 查询门店-返回参数(UserMD) *****/
	public static class QueryMdList extends JsonData{
		private static final long serialVersionUID = 1L;

		public List<com.mdx.store.data.proto.Gongying.QueryMd > data=new ArrayList<com.mdx.store.data.proto.Gongying.QueryMd > (); //评论列表

		public QueryMdList() throws Exception {
		}

		public QueryMdList(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			getJsonArray(json, "data", com.mdx.store.data.proto.Gongying.QueryMd .class, data); //评论列表
		}

	}

	/***** 查询积分-返回参数(UserJF) *****/
	public static class QueryJdkList extends JsonData{
		private static final long serialVersionUID = 1L;

		public List<com.mdx.store.data.proto.Gongying.QueryJdk > data=new ArrayList<com.mdx.store.data.proto.Gongying.QueryJdk > (); //评论列表

		public QueryJdkList() throws Exception {
		}

		public QueryJdkList(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			getJsonArray(json, "data", com.mdx.store.data.proto.Gongying.QueryJdk .class, data); //评论列表
		}

	}

	/***** 参数UserKey *****/
	public static class QueryCKBySMM extends JsonData{
		private static final long serialVersionUID = 1L;

		public String mclass; //固定不用管
		public String spcode; //产品code
		public String spname; //产品名称
		public String spcount; //数量
		public String dj; //单价
		public String allje; //总价
		public String jldj; //奖励单价

		public QueryCKBySMM() throws Exception {
		}

		public QueryCKBySMM(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			mclass= getJsonString(json,"class"); //固定不用管
			spcode= getJsonString(json,"spcode"); //产品code
			spname= getJsonString(json,"spname"); //产品名称
			spcount= getJsonString(json,"spcount"); //数量
			dj= getJsonString(json,"dj"); //单价
			allje= getJsonString(json,"allje"); //总价
			jldj= getJsonString(json,"jldj"); //奖励单价
		}

	}

	/*****  *****/
	public static class QueryCKBySMMList extends JsonData{
		private static final long serialVersionUID = 1L;

		public List<com.mdx.store.data.proto.Gongying.QueryCKBySMM > data=new ArrayList<com.mdx.store.data.proto.Gongying.QueryCKBySMM > (); //评论列表

		public QueryCKBySMMList() throws Exception {
		}

		public QueryCKBySMMList(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			getJsonArray(json, "data", com.mdx.store.data.proto.Gongying.QueryCKBySMM .class, data); //评论列表
		}

	}

	/***** 参数UserJF *****/
	public static class XsckDetail extends JsonData{
		private static final long serialVersionUID = 1L;

		public String mclass; //固定不用管
		public String retuenmsg; //积分
		public String returntype; //状态
		public String smm; //序号

		public XsckDetail() throws Exception {
		}

		public XsckDetail(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			mclass= getJsonString(json,"class"); //固定不用管
			retuenmsg= getJsonString(json,"retuenmsg"); //积分
			returntype= getJsonString(json,"returntype"); //状态
			smm= getJsonString(json,"smm"); //序号
		}

	}

	/*****  *****/
	public static class KcpdSpList extends JsonData{
		private static final long serialVersionUID = 1L;

		public List<com.mdx.store.data.proto.Gongying.KcpdSp > data=new ArrayList<com.mdx.store.data.proto.Gongying.KcpdSp > (); //评论列表

		public KcpdSpList() throws Exception {
		}

		public KcpdSpList(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			getJsonArray(json, "data", com.mdx.store.data.proto.Gongying.KcpdSp .class, data); //评论列表
		}

	}

	/***** 参数UserKey *****/
	public static class KcpdSp extends JsonData{
		private static final long serialVersionUID = 1L;

		public String pk_cpkey; //固定不用管
		public String cpcode; //产品code
		public String cpname; //产品名称
		public String cpprice; //数量
		public List<String > smms=new ArrayList<String > (); //产品名称
		public String smm; //产品名称
		public String msg; //返回值

		public KcpdSp() throws Exception {
		}

		public KcpdSp(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			pk_cpkey= getJsonString(json,"pk_cpkey"); //固定不用管
			cpcode= getJsonString(json,"cpcode"); //产品code
			cpname= getJsonString(json,"cpname"); //产品名称
			cpprice= getJsonString(json,"cpprice"); //数量
			getJsonArray(json, "smms", String .class, smms); //产品名称
			smm= getJsonString(json,"smm"); //产品名称
			msg= getJsonString(json,"msg"); //返回值
		}

	}

	/*****  *****/
	public static class KupdList extends JsonData{
		private static final long serialVersionUID = 1L;

		public List<com.mdx.store.data.proto.Gongying.Kupd > data=new ArrayList<com.mdx.store.data.proto.Gongying.Kupd > (); //评论列表

		public KupdList() throws Exception {
		}

		public KupdList(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			getJsonArray(json, "data", com.mdx.store.data.proto.Gongying.Kupd .class, data); //评论列表
		}

	}

	/*****  *****/
	public static class QueryMd extends JsonData{
		private static final long serialVersionUID = 1L;

		public String mclass; //固定不用管
		public String key; //商品编码
		public String mdcode; //商品名称
		public String mdname; //库存数量

		public QueryMd() throws Exception {
		}

		public QueryMd(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			mclass= getJsonString(json,"class"); //固定不用管
			key= getJsonString(json,"key"); //商品编码
			mdcode= getJsonString(json,"mdcode"); //商品名称
			mdname= getJsonString(json,"mdname"); //库存数量
		}

	}

	/*****  *****/
	public static class QueryKc extends JsonData{
		private static final long serialVersionUID = 1L;

		public String mclass; //固定不用管
		public String spcode; //商品编码
		public String spname; //商品名称
		public String spcount; //库存数量
		public String dj; //库存数量
		public String allje; //库存数量

		public QueryKc() throws Exception {
		}

		public QueryKc(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			mclass= getJsonString(json,"class"); //固定不用管
			spcode= getJsonString(json,"spcode"); //商品编码
			spname= getJsonString(json,"spname"); //商品名称
			spcount= getJsonString(json,"spcount"); //库存数量
			dj= getJsonString(json,"dj"); //库存数量
			allje= getJsonString(json,"allje"); //库存数量
		}

	}

	/***** 扫描-传入参数(UserReturnMSG) *****/
	public static class Xsck extends JsonData{
		private static final long serialVersionUID = 1L;

		public String mclass; //固定不用管
		public String returntype; //1代表成功,2代表失败
		public String retuenmsg; //出现错误时候，这里给出错误信息
		public List<com.mdx.store.data.proto.Gongying.XsckDetail > data=new ArrayList<com.mdx.store.data.proto.Gongying.XsckDetail > (); //评论列表

		public Xsck() throws Exception {
		}

		public Xsck(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			mclass= getJsonString(json,"class"); //固定不用管
			returntype= getJsonString(json,"returntype"); //1代表成功,2代表失败
			retuenmsg= getJsonString(json,"retuenmsg"); //出现错误时候，这里给出错误信息
			getJsonArray(json, "data", com.mdx.store.data.proto.Gongying.XsckDetail .class, data); //评论列表
		}

	}

	/***** 参数UserKey *****/
	public static class QueryMonthXse extends JsonData{
		private static final long serialVersionUID = 1L;

		public String je; //单价
		public String kccount; //总价

		public QueryMonthXse() throws Exception {
		}

		public QueryMonthXse(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			je= getJsonString(json,"je"); //单价
			kccount= getJsonString(json,"kccount"); //总价
		}

	}

	/***** 参数UserKey *****/
	public static class QueryJFDetail extends JsonData{
		private static final long serialVersionUID = 1L;

		public String mclass; //固定不用管
		public String datae; //产品code
		public String dj; //产品名称
		public String jfshul; //数量
		public String jfslbak; //单价
		public String spcode; //总价
		public String spcount; //总价
		public String spname; //总价
		public String txm; //总价
		public String jlshul; //总价
		public String jlback; //总价
		public String jldj; //奖励单价
		public String je; //单价
		public String kccount; //总价

		public QueryJFDetail() throws Exception {
		}

		public QueryJFDetail(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			mclass= getJsonString(json,"class"); //固定不用管
			datae= getJsonString(json,"datae"); //产品code
			dj= getJsonString(json,"dj"); //产品名称
			jfshul= getJsonString(json,"jfshul"); //数量
			jfslbak= getJsonString(json,"jfslbak"); //单价
			spcode= getJsonString(json,"spcode"); //总价
			spcount= getJsonString(json,"spcount"); //总价
			spname= getJsonString(json,"spname"); //总价
			txm= getJsonString(json,"txm"); //总价
			jlshul= getJsonString(json,"jlshul"); //总价
			jlback= getJsonString(json,"jlback"); //总价
			jldj= getJsonString(json,"jldj"); //奖励单价
			je= getJsonString(json,"je"); //单价
			kccount= getJsonString(json,"kccount"); //总价
		}

	}

	/***** 参数UserKey *****/
	public static class QueryXjCK extends JsonData{
		private static final long serialVersionUID = 1L;

		public String mclass; //固定不用管
		public String key; //返回门店的key
		public String mdcode; //门店编码
		public String mdname; //门店名称
		public String spcode; //产品code
		public String spname; //产品名称
		public String spcount; //数量
		public String dj; //单价
		public String allje; //总价

		public QueryXjCK() throws Exception {
		}

		public QueryXjCK(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			mclass= getJsonString(json,"class"); //固定不用管
			key= getJsonString(json,"key"); //返回门店的key
			mdcode= getJsonString(json,"mdcode"); //门店编码
			mdname= getJsonString(json,"mdname"); //门店名称
			spcode= getJsonString(json,"spcode"); //产品code
			spname= getJsonString(json,"spname"); //产品名称
			spcount= getJsonString(json,"spcount"); //数量
			dj= getJsonString(json,"dj"); //单价
			allje= getJsonString(json,"allje"); //总价
		}

	}

	/*****  *****/
	public static class QueryJFDetailList extends JsonData{
		private static final long serialVersionUID = 1L;

		public List<com.mdx.store.data.proto.Gongying.QueryJFDetail > data=new ArrayList<com.mdx.store.data.proto.Gongying.QueryJFDetail > (); //评论列表

		public QueryJFDetailList() throws Exception {
		}

		public QueryJFDetailList(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			getJsonArray(json, "data", com.mdx.store.data.proto.Gongying.QueryJFDetail .class, data); //评论列表
		}

	}

	/***** 参数UserKey *****/
	public static class Kupd extends JsonData{
		private static final long serialVersionUID = 1L;

		public String returntype; //固定不用管
		public String retuenmsg; //产品code
		public String smm; //产品名称

		public Kupd() throws Exception {
		}

		public Kupd(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			returntype= getJsonString(json,"returntype"); //固定不用管
			retuenmsg= getJsonString(json,"retuenmsg"); //产品code
			smm= getJsonString(json,"smm"); //产品名称
		}

	}

	/***** 查询库存-返回参数(UserccReturn) *****/
	public static class QueryKcList extends JsonData{
		private static final long serialVersionUID = 1L;

		public List<com.mdx.store.data.proto.Gongying.QueryKc > data=new ArrayList<com.mdx.store.data.proto.Gongying.QueryKc > (); //评论列表

		public QueryKcList() throws Exception {
		}

		public QueryKcList(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			getJsonArray(json, "data", com.mdx.store.data.proto.Gongying.QueryKc .class, data); //评论列表
		}

	}

	/***** 登录-返回参数(ReturnUser) *****/
	public static class Login extends JsonData{
		private static final long serialVersionUID = 1L;

		public String mclass; //固定不用管
		public String returntype; //1登录成功,2登录失败
		public String usertype; //1代理商  2门店
		public String deptname; //登录成功后给出对应店铺名称
		public String key; //登录key  

		public Login() throws Exception {
		}

		public Login(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			mclass= getJsonString(json,"class"); //固定不用管
			returntype= getJsonString(json,"returntype"); //1登录成功,2登录失败
			usertype= getJsonString(json,"usertype"); //1代理商  2门店
			deptname= getJsonString(json,"deptname"); //登录成功后给出对应店铺名称
			key= getJsonString(json,"key"); //登录key  
		}

	}

	/*****  *****/
	public static class QueryXjCKList extends JsonData{
		private static final long serialVersionUID = 1L;

		public List<com.mdx.store.data.proto.Gongying.QueryXjCK > data=new ArrayList<com.mdx.store.data.proto.Gongying.QueryXjCK > (); //评论列表

		public QueryXjCKList() throws Exception {
		}

		public QueryXjCKList(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			getJsonArray(json, "data", com.mdx.store.data.proto.Gongying.QueryXjCK .class, data); //评论列表
		}

	}

	/***** 参数UserKey *****/
	public static class MDXX extends JsonData{
		private static final long serialVersionUID = 1L;

		public String mydls; //归属代理商
		public String mysf; //归属省份
		public String mycity; //归属城市
		public String connectman; //联系人
		public String connectmobile; //联系电话
		public String connectaddr; //联系地址
		public String khsf; //开户省份
		public String khcity; //开户城市
		public String psnname; //开户名
		public String yhkh; //银行卡号
		public String khh; //开户行
		public String appstatus; //帐号审批状态

		public MDXX() throws Exception {
		}

		public MDXX(JSONObject json) throws Exception {
			this.build(json);
		}

		public void build(JSONObject json) throws Exception{
			mydls= getJsonString(json,"mydls"); //归属代理商
			mysf= getJsonString(json,"mysf"); //归属省份
			mycity= getJsonString(json,"mycity"); //归属城市
			connectman= getJsonString(json,"connectman"); //联系人
			connectmobile= getJsonString(json,"connectmobile"); //联系电话
			connectaddr= getJsonString(json,"connectaddr"); //联系地址
			khsf= getJsonString(json,"khsf"); //开户省份
			khcity= getJsonString(json,"khcity"); //开户城市
			psnname= getJsonString(json,"psnname"); //开户名
			yhkh= getJsonString(json,"yhkh"); //银行卡号
			khh= getJsonString(json,"khh"); //开户行
			appstatus= getJsonString(json,"appstatus"); //帐号审批状态
		}

	}


}
