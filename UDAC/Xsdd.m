//
//  Xsdd.h
//  Xsdd
//
//  Created by liulu on 2014-10-07 17:13:11
//  Copyright (c) liulu All rights reserved.
//
//
/**

**/
#import "Xsdd.h"


/***** 销售订单列表 *****/
@implementation RetnList

@synthesize data; //评论列表

- (void) build:(NSDictionary*)json{
        data=[JsonData getJsonArray:json key:@"data" clas:@"Retn" msg:nil]; //评论列表
}


@end

/*****  *****/
@implementation Retn

@synthesize returntype; //商品编号
@synthesize retuenmsg;

- (void) build:(NSDictionary*)json{
        returntype=[JsonData getJsonString:json key:@"returntype"]; //商品编号
        retuenmsg=[JsonData getJsonString:json key:@"retuenmsg"];
}


@end

/***** 销售订单列表 *****/
@implementation XsddQuerydetailOrderList

@synthesize data; //订单商品明细

- (void) build:(NSDictionary*)json{
        data=[JsonData getJsonArray:json key:@"data" clas:@"XsddQuerydetailOrder" msg:nil]; //订单商品明细
}


@end

/***** 销售订单列表 *****/
@implementation XsddQueryAllOrderList

@synthesize data; //评论列表

- (void) build:(NSDictionary*)json{
        data=[JsonData getJsonArray:json key:@"data" clas:@"XsddQueryAllOrder" msg:nil]; //评论列表
}


@end

/*****  *****/
@implementation XsddQueryAllOrder

@synthesize billcode; //订单号
@synthesize riqi; //订单日期
@synthesize kh; //客户
@synthesize shdw; //收货单位
@synthesize shdiz; //收货地址
@synthesize ywy; //业务员

- (void) build:(NSDictionary*)json{
        billcode=[JsonData getJsonString:json key:@"billcode"]; //订单号
        riqi=[JsonData getJsonString:json key:@"riqi"]; //订单日期
        kh=[JsonData getJsonString:json key:@"kh"]; //客户
        shdw=[JsonData getJsonString:json key:@"shdw"]; //收货单位
        shdiz=[JsonData getJsonString:json key:@"shdiz"]; //收货地址
        ywy=[JsonData getJsonString:json key:@"ywy"]; //业务员
}


@end

/*****  *****/
@implementation XsddQuerydetailOrder

@synthesize spcode; //商品编号
@synthesize spname; //名称
@synthesize spcount; //数量

- (void) build:(NSDictionary*)json{
        spcode=[JsonData getJsonString:json key:@"spcode"]; //商品编号
        spname=[JsonData getJsonString:json key:@"spname"]; //名称
        spcount=[JsonData getJsonString:json key:@"spcount"]; //数量
}


@end

