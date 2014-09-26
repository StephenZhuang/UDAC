//
//  GongT.h
//  GongT
//
//  Created by liulu on 2014-09-25 18:52:22
//  Copyright (c) liulu All rights reserved.
//
//
/**

**/
#import "GongT.h"


/***** 查询库存-返回参数(UserccReturn) *****/
@implementation QueryAllCanBackCPList

@synthesize data; //评论列表

- (void) build:(NSDictionary*)json{
        data=[JsonData getJsonArray:json key:@"data" clas:@"QueryAllCanBackCP" msg:nil]; //评论列表
}


@end

/*****  *****/
@implementation QueryJlJE

@synthesize allje; //累计奖励额度
@synthesize dhje; //兑换额度
@synthesize ffe; //发放金额
@synthesize yue; //余额 

- (void) build:(NSDictionary*)json{
        allje=[JsonData getJsonString:json key:@"allje"]; //累计奖励额度
        dhje=[JsonData getJsonString:json key:@"dhje"]; //兑换额度
        ffe=[JsonData getJsonString:json key:@"ffe"]; //发放金额
        yue=[JsonData getJsonString:json key:@"yue"]; //余额 
}


@end

/***** 查询库存-返回参数(UserccReturn) *****/
@implementation QueryAllMyOrderList

@synthesize data; //评论列表

- (void) build:(NSDictionary*)json{
        data=[JsonData getJsonArray:json key:@"data" clas:@"QueryAllMyOrder" msg:nil]; //评论列表
}


@end

/*****  *****/
@implementation QueryDetailByCode

@synthesize cpcode; //商品编码
@synthesize cpname; //商品名称
@synthesize cpcount; //商品数量
@synthesize cpprice; //商品单价
@synthesize allprice; //商品总额

- (void) build:(NSDictionary*)json{
        cpcode=[JsonData getJsonString:json key:@"cpcode"]; //商品编码
        cpname=[JsonData getJsonString:json key:@"cpname"]; //商品名称
        cpcount=[JsonData getJsonString:json key:@"cpcount"]; //商品数量
        cpprice=[JsonData getJsonString:json key:@"cpprice"]; //商品单价
        allprice=[JsonData getJsonString:json key:@"allprice"]; //商品总额
}


@end

/***** 查询库存-返回参数(UserccReturn) *****/
@implementation QueryAllMyJLOrderList

@synthesize data; //评论列表

- (void) build:(NSDictionary*)json{
        data=[JsonData getJsonArray:json key:@"data" clas:@"QueryAllMyJLOrder" msg:nil]; //评论列表
}


@end

/*****  *****/
@implementation QueryJlJECount

@synthesize je; //代表总额
@synthesize kccount; //代表总数量 

- (void) build:(NSDictionary*)json{
        je=[JsonData getJsonString:json key:@"je"]; //代表总额
        kccount=[JsonData getJsonString:json key:@"kccount"]; //代表总数量 
}


@end

/*****  *****/
@implementation MakeJFOrder

@synthesize retuenmsg; //对应的失败或者成功信息，成功的时候也要提示信息s
@synthesize returntype; //1 代表成功 2 代表失败
@synthesize mclass; //商品名称

- (void) build:(NSDictionary*)json{
        retuenmsg=[JsonData getJsonString:json key:@"retuenmsg"]; //对应的失败或者成功信息，成功的时候也要提示信息s
        returntype=[JsonData getJsonString:json key:@"returntype"]; //1 代表成功 2 代表失败
        mclass=[JsonData getJsonString:json key:@"class"]; //商品名称
}


@end

/*****  *****/
@implementation QueryAllMyOrder

@synthesize allcount; //总数
@synthesize allprice; //总额
@synthesize appdate; //审批日期
@synthesize appstatus; //发货状态
@synthesize backdate; //兑换日期
@synthesize mclass;
@synthesize connectaddr; //联系地址
@synthesize connectman; //联系人
@synthesize connectmoblie; // 联系电话
@synthesize dbillcode; //单据号
@synthesize sendcode; //货运单号 
@synthesize sendcorp; //发货公司
@synthesize senddate; //发货日期
@synthesize sendstatus; //发货状态
@synthesize cpcode; //商品编码
@synthesize cpname; //商品名称
@synthesize cpcount; //商品数量
@synthesize cpprice; //商品单价
@synthesize allprice; //商品单价
@synthesize sendcount; //发放金额
@synthesize surestatus; //确认状态
@synthesize suredate; //确认日期

- (void) build:(NSDictionary*)json{
        allcount=[JsonData getJsonString:json key:@"allcount"]; //总数
        allprice=[JsonData getJsonString:json key:@"allprice"]; //总额
        appdate=[JsonData getJsonString:json key:@"appdate"]; //审批日期
        appstatus=[JsonData getJsonString:json key:@"appstatus"]; //发货状态
        backdate=[JsonData getJsonString:json key:@"backdate"]; //兑换日期
        mclass=[JsonData getJsonString:json key:@"class"];
        connectaddr=[JsonData getJsonString:json key:@"connectaddr"]; //联系地址
        connectman=[JsonData getJsonString:json key:@"connectman"]; //联系人
        connectmoblie=[JsonData getJsonString:json key:@"connectmoblie"]; // 联系电话
        dbillcode=[JsonData getJsonString:json key:@"dbillcode"]; //单据号
        sendcode=[JsonData getJsonString:json key:@"sendcode"]; //货运单号 
        sendcorp=[JsonData getJsonString:json key:@"sendcorp"]; //发货公司
        senddate=[JsonData getJsonString:json key:@"senddate"]; //发货日期
        sendstatus=[JsonData getJsonString:json key:@"sendstatus"]; //发货状态
        cpcode=[JsonData getJsonString:json key:@"cpcode"]; //商品编码
        cpname=[JsonData getJsonString:json key:@"cpname"]; //商品名称
        cpcount=[JsonData getJsonString:json key:@"cpcount"]; //商品数量
        cpprice=[JsonData getJsonString:json key:@"cpprice"]; //商品单价
        allprice=[JsonData getJsonString:json key:@"allprice"]; //商品单价
        sendcount=[JsonData getJsonString:json key:@"sendcount"]; //发放金额
        surestatus=[JsonData getJsonString:json key:@"surestatus"]; //确认状态
        suredate=[JsonData getJsonString:json key:@"suredate"]; //确认日期
}


@end

/*****  *****/
@implementation QueryAllMyJLOrder

@synthesize dbillcode; //总数
@synthesize allcount; //总额
@synthesize backdate; //审批日期
@synthesize appstatus; //发货状态
@synthesize appdate; //兑换日期
@synthesize sendstatus;
@synthesize senddate; //联系地址
@synthesize sendcount; //联系人
@synthesize surestatus; // 联系电话
@synthesize suredate; //货运单号 

- (void) build:(NSDictionary*)json{
        dbillcode=[JsonData getJsonString:json key:@"dbillcode"]; //总数
        allcount=[JsonData getJsonString:json key:@"allcount"]; //总额
        backdate=[JsonData getJsonString:json key:@"backdate"]; //审批日期
        appstatus=[JsonData getJsonString:json key:@"appstatus"]; //发货状态
        appdate=[JsonData getJsonString:json key:@"appdate"]; //兑换日期
        sendstatus=[JsonData getJsonString:json key:@"sendstatus"];
        senddate=[JsonData getJsonString:json key:@"senddate"]; //联系地址
        sendcount=[JsonData getJsonString:json key:@"sendcount"]; //联系人
        surestatus=[JsonData getJsonString:json key:@"surestatus"]; // 联系电话
        suredate=[JsonData getJsonString:json key:@"suredate"]; //货运单号 
}


@end

/*****  *****/
@implementation QueryAllCanBackCP

@synthesize mclass; //固定不用管
@synthesize cpcode; //商品编码
@synthesize cpname; //商品名称
@synthesize pk_cpkey; //产品Key
@synthesize cpprice; //产品单价

- (void) build:(NSDictionary*)json{
        mclass=[JsonData getJsonString:json key:@"class"]; //固定不用管
        cpcode=[JsonData getJsonString:json key:@"cpcode"]; //商品编码
        cpname=[JsonData getJsonString:json key:@"cpname"]; //商品名称
        pk_cpkey=[JsonData getJsonString:json key:@"pk_cpkey"]; //产品Key
        cpprice=[JsonData getJsonString:json key:@"cpprice"]; //产品单价
}


@end

/***** 查询库存-返回参数(UserccReturn) *****/
@implementation QueryDetailByCodeList

@synthesize data; //评论列表

- (void) build:(NSDictionary*)json{
        data=[JsonData getJsonArray:json key:@"data" clas:@"QueryAllMyOrder" msg:nil]; //评论列表
}


@end

