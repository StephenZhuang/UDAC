//
//  Gongying.h
//  Gongying
//
//  Created by ryan on 2014-07-02 18:28:21
//  Copyright (c) ryan All rights reserved.
//
//
/**

**/
#import "Gongying.h"


/***** 查询库存-返回参数(UserccReturn) *****/
@implementation QueryKcList

@synthesize data; //评论列表

- (void) build:(NSDictionary*)json{
        data=[JsonData getJsonArray:json key:@"data" clas:@"QueryKc" msg:nil]; //评论列表
}


@end

/*****  *****/
@implementation QueryKc

@synthesize mclass; //固定不用管
@synthesize spcode; //商品编码
@synthesize spname; //商品名称
@synthesize spcount; //库存数量

- (void) build:(NSDictionary*)json{
        mclass=[JsonData getJsonString:json key:@"class"]; //固定不用管
        spcode=[JsonData getJsonString:json key:@"spcode"];
                 if([spcode isEqual:[NSNull null]]) spcode = @""; //商品编码
    spname=[JsonData getJsonString:json key:@"spname"];
                if([spname isEqual:[NSNull null]]) spname = @"" ; //商品名称
//        spcount=[JsonData getJsonString:json key:@"spcount"]; //库存数量
    spcount = [json objectForKey:@"spcount"];
}


@end

/***** 登录-返回参数(ReturnUser) *****/
@implementation Login

@synthesize mclass; //固定不用管
@synthesize returntype; //1登录成功,2登录失败
@synthesize usertype; //1代理商  2门店
@synthesize deptname; //登录成功后给出对应店铺名称
@synthesize key; //登录key  

- (void) build:(NSDictionary*)json{
        mclass=[JsonData getJsonString:json key:@"class"]; //固定不用管
        returntype=[JsonData getJsonString:json key:@"returntype"]; //1登录成功,2登录失败
        usertype=[JsonData getJsonString:json key:@"usertype"]; //1代理商  2门店
        deptname=[JsonData getJsonString:json key:@"deptname"]; //登录成功后给出对应店铺名称
        key=[JsonData getJsonString:json key:@"key"]; //登录key  
}


@end

/***** 查询门店-返回参数(UserMD) *****/
@implementation QueryMdList

@synthesize data; //评论列表

- (void) build:(NSDictionary*)json{
        data=[JsonData getJsonArray:json key:@"data" clas:@"QueryMd" msg:nil]; //评论列表
}


@end

/***** 查询积分-返回参数(UserJF) *****/
@implementation QueryJdkList

@synthesize data; //评论列表

- (void) build:(NSDictionary*)json{
        data=[JsonData getJsonArray:json key:@"data" clas:@"QueryJdk" msg:nil]; //评论列表
}


@end

/*****  *****/
@implementation QueryMd

@synthesize mclass; //固定不用管
@synthesize key; //商品编码
@synthesize mdcode; //商品名称
@synthesize mdname; //库存数量

- (void) build:(NSDictionary*)json{
        mclass=[JsonData getJsonString:json key:@"class"]; //固定不用管
        key=[JsonData getJsonString:json key:@"key"]; //商品编码
        mdcode=[JsonData getJsonString:json key:@"mdcode"]; //商品名称
        mdname=[JsonData getJsonString:json key:@"mdname"]; //库存数量
}


@end

/***** 参数UserKey *****/
@implementation QueryXjCK

@synthesize mclass; //固定不用管
@synthesize key; //返回门店的key
@synthesize mdcode; //门店编码
@synthesize mdname; //门店名称
@synthesize spcode; //产品code
@synthesize spname; //产品名称
@synthesize spcount; //数量

- (void) build:(NSDictionary*)json{
        mclass=[JsonData getJsonString:json key:@"class"]; //固定不用管
        key=[JsonData getJsonString:json key:@"key"]; //返回门店的key
        mdcode=[JsonData getJsonString:json key:@"mdcode"]; //门店编码
        mdname=[JsonData getJsonString:json key:@"mdname"]; //门店名称
        spcode=[JsonData getJsonString:json key:@"spcode"]; //产品code
    spname=[JsonData getJsonString:json key:@"spname"]; //产品名称
    if ([spname isEqual:[NSNull null]]) {
        spname = @"";
    }
    if ([spcode isEqual:[NSNull null]]) {
        spcode = @"";
    }
    
//        spcount=[JsonData getJsonString:json key:@"spcount"]; //数量
    spcount = [json objectForKey:@"spcount"];
}


@end

/***** 参数UserJF *****/
@implementation QueryJdk

@synthesize mclass; //固定不用管
@synthesize jf; //积分
@synthesize jfbak; //已兑换积分
@synthesize rq; //日期

- (void) build:(NSDictionary*)json{
        mclass=[JsonData getJsonString:json key:@"class"]; //固定不用管
        jf = [json objectForKey:@"jf"];
        jfbak = [json objectForKey:@"jfbak"];
//        jf=[JsonData getJsonString:json key:@"jf"]; //积分
//        jfbak=[JsonData getJsonString:json key:@"jfbak"]; //已兑换积分
        rq=[JsonData getJsonString:json key:@"rq"]; //日期
}


@end

/***** 参数UserKey *****/
@implementation QueryCKBySMM

@synthesize mclass; //固定不用管
@synthesize spcode; //产品code
@synthesize spname; //产品名称
@synthesize spcount; //数量

- (void) build:(NSDictionary*)json{
        mclass=[JsonData getJsonString:json key:@"class"]; //固定不用管
        spcode=[JsonData getJsonString:json key:@"spcode"]; //产品code
        spname=[JsonData getJsonString:json key:@"spname"]; //产品名称
    if ([spname isEqual:[NSNull null]]) {
        spname = @"";
    }
    if ([spcode isEqual:[NSNull null]]) {
        spcode = @"";
    }
//        spcount=[JsonData getJsonString:json key:@"spcount"]; //数量
    spcount = [json objectForKey:@"spcount"];
}


@end

/*****  *****/
@implementation QueryCKBySMMList

@synthesize data; //评论列表

- (void) build:(NSDictionary*)json{
        data=[JsonData getJsonArray:json key:@"data" clas:@"QueryCKBySMM" msg:nil]; //评论列表
}


@end

/*****  *****/
@implementation QueryXjCKList

@synthesize data; //评论列表

- (void) build:(NSDictionary*)json{
        data=[JsonData getJsonArray:json key:@"data" clas:@"QueryXjCK" msg:nil]; //评论列表
}


@end

/***** 扫描-传入参数(UserReturnMSG) *****/
@implementation Xsck

@synthesize mclass; //固定不用管
@synthesize returntype; //1代表成功,2代表失败
@synthesize retuenmsg; //出现错误时候，这里给出错误信息

- (void) build:(NSDictionary*)json{
        mclass=[JsonData getJsonString:json key:@"class"]; //固定不用管
        returntype=[JsonData getJsonString:json key:@"returntype"]; //1代表成功,2代表失败
        retuenmsg=[JsonData getJsonString:json key:@"retuenmsg"]; //出现错误时候，这里给出错误信息
}


@end

