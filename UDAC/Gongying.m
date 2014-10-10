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
@synthesize dj; //库存数量
@synthesize allje; //库存数量

- (void) build:(NSDictionary*)json{
        mclass=[JsonData getJsonString:json key:@"class"]; //固定不用管
        spcode=[JsonData getJsonString:json key:@"spcode"];
                 if([spcode isEqual:[NSNull null]]) spcode = @""; //商品编码
    spname=[JsonData getJsonString:json key:@"spname"];
                if([spname isEqual:[NSNull null]]) spname = @"" ; //商品名称
//        spcount=[JsonData getJsonString:json key:@"spcount"]; //库存数量
    spcount = [json objectForKey:@"spcount"];
    dj=[JsonData getJsonString:json key:@"dj"]; //库存数量
    allje=[JsonData getJsonString:json key:@"allje"]; //库存数量
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

/*****  *****/
@implementation QueryJFDetailList

@synthesize data; //评论列表

- (void) build:(NSDictionary*)json{
    data=[JsonData getJsonArray:json key:@"data" clas:@"QueryJFDetail" msg:nil]; //评论列表
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
@synthesize dj; //单价
@synthesize allje; //总价

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
    dj=[JsonData getJsonString:json key:@"dj"]; //单价
    allje=[JsonData getJsonString:json key:@"allje"]; //总价
}


@end

/***** 参数UserJF *****/
@implementation QueryJdk

@synthesize mclass; //固定不用管
@synthesize jf; //积分
@synthesize jfbak; //已兑换积分
@synthesize rq; //日期
@synthesize yue; //余额


- (void) build:(NSDictionary*)json{
        mclass=[JsonData getJsonString:json key:@"class"]; //固定不用管
        jf = [json objectForKey:@"jf"];
        jfbak = [json objectForKey:@"jfbak"];
//        jf=[JsonData getJsonString:json key:@"jf"]; //积分
//        jfbak=[JsonData getJsonString:json key:@"jfbak"]; //已兑换积分
        rq=[JsonData getJsonString:json key:@"rq"]; //日期
        yue=[JsonData getJsonString:json key:@"yue"]; //余额
}


@end

/***** 参数UserKey *****/
@implementation QueryCKBySMM

@synthesize mclass; //固定不用管
@synthesize spcode; //产品code
@synthesize spname; //产品名称
@synthesize spcount; //数量
@synthesize allje; //总价
@synthesize jldj; //奖励单价

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
    allje=[JsonData getJsonString:json key:@"allje"]; //总价
    jldj=[JsonData getJsonString:json key:@"jldj"]; //奖励单价
}


@end


/***** 参数UserJF *****/
@implementation XsckDetail

@synthesize mclass; //固定不用管
@synthesize retuenmsg; //积分
@synthesize returntype; //状态
@synthesize smm; //序号

- (void) build:(NSDictionary*)json{
    mclass=[JsonData getJsonString:json key:@"class"]; //固定不用管
    retuenmsg=[JsonData getJsonString:json key:@"retuenmsg"]; //积分
    returntype=[JsonData getJsonString:json key:@"returntype"]; //状态
    smm=[JsonData getJsonString:json key:@"smm"]; //序号
}


@end

/***** 参数UserKey *****/
@implementation KcpdSp

@synthesize pk_cpkey; //固定不用管
@synthesize cpcode; //产品code
@synthesize cpname; //产品名称
@synthesize cpprice; //数量
@synthesize smms; //产品名称
@synthesize smm; //产品名称
@synthesize msg; //返回值

- (void) build:(NSDictionary*)json{
    pk_cpkey=[JsonData getJsonString:json key:@"pk_cpkey"]; //固定不用管
    cpcode=[JsonData getJsonString:json key:@"cpcode"]; //产品code
    cpname=[JsonData getJsonString:json key:@"cpname"]; //产品名称
    cpprice=[JsonData getJsonString:json key:@"cpprice"]; //数量
    smms=[JsonData getJsonArray:json key:@"smms" clas:@"string" msg:nil]; //产品名称
    smm=[JsonData getJsonString:json key:@"smm"]; //产品名称
    msg=[JsonData getJsonString:json key:@"msg"]; //返回值
}


@end

/*****  *****/
@implementation KcpdSpList

@synthesize data; //评论列表

- (void) build:(NSDictionary*)json{
    data=[JsonData getJsonArray:json key:@"data" clas:@"KcpdSp" msg:nil]; //评论列表
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

/*****  *****/
@implementation KupdList

@synthesize data; //评论列表

- (void) build:(NSDictionary*)json{
    data=[JsonData getJsonArray:json key:@"data" clas:@"Kupd" msg:nil]; //评论列表
}


@end

/***** 参数UserKey *****/
@implementation Kupd

@synthesize returntype; //固定不用管
@synthesize retuenmsg; //产品code
@synthesize smm; //产品名称

- (void) build:(NSDictionary*)json{
    returntype=[JsonData getJsonString:json key:@"returntype"]; //固定不用管
    retuenmsg=[JsonData getJsonString:json key:@"retuenmsg"]; //产品code
    smm=[JsonData getJsonString:json key:@"smm"]; //产品名称
}


@end

/***** 扫描-传入参数(UserReturnMSG) *****/
@implementation Xsck

@synthesize mclass; //固定不用管
@synthesize returntype; //1代表成功,2代表失败
@synthesize retuenmsg; //出现错误时候，这里给出错误信息
@synthesize data; //评论列表

- (void) build:(NSDictionary*)json{
        mclass=[JsonData getJsonString:json key:@"class"]; //固定不用管
        returntype=[JsonData getJsonString:json key:@"returntype"]; //1代表成功,2代表失败
        retuenmsg=[JsonData getJsonString:json key:@"retuenmsg"]; //出现错误时候，这里给出错误信息
            data=[JsonData getJsonArray:json key:@"data" clas:@"XsckDetail" msg:nil]; //评论列表
}


@end

/***** 参数UserKey *****/
@implementation QueryMonthXse

@synthesize je; //单价
@synthesize kccount; //总价

- (void) build:(NSDictionary*)json{
    je=[JsonData getJsonString:json key:@"je"]; //单价
    kccount=[JsonData getJsonString:json key:@"kccount"]; //总价
}


@end

/***** 参数UserKey *****/
@implementation QueryJFDetail

@synthesize mclass; //固定不用管
@synthesize datae; //产品code
@synthesize dj; //产品名称
@synthesize jfshul; //数量
@synthesize jfslbak; //单价
@synthesize spcode; //总价
@synthesize spcount; //总价
@synthesize spname; //总价
@synthesize txm; //总价
@synthesize jlshul; //总价
@synthesize jlback; //总价
@synthesize jldj; //奖励单价
@synthesize je; //单价
@synthesize kccount; //总价

- (void) build:(NSDictionary*)json{
    mclass=[JsonData getJsonString:json key:@"class"]; //固定不用管
    datae=[JsonData getJsonString:json key:@"datae"]; //产品code
    dj=[JsonData getJsonString:json key:@"dj"]; //产品名称
    jfshul=[JsonData getJsonString:json key:@"jfshul"]; //数量
    jfslbak=[JsonData getJsonString:json key:@"jfslbak"]; //单价
    spcode=[JsonData getJsonString:json key:@"spcode"]; //总价
    spcount=[JsonData getJsonString:json key:@"spcount"]; //总价
    spname=[JsonData getJsonString:json key:@"spname"]; //总价
    txm=[JsonData getJsonString:json key:@"txm"]; //总价
    jlshul=[JsonData getJsonString:json key:@"jlshul"]; //总价
    jlback=[JsonData getJsonString:json key:@"jlback"]; //总价
    jldj=[JsonData getJsonString:json key:@"jldj"]; //奖励单价
    je=[JsonData getJsonString:json key:@"je"]; //单价
    kccount=[JsonData getJsonString:json key:@"kccount"]; //总价
}


@end


/***** 参数UserKey *****/
@implementation MDXX

@synthesize mydls; //归属代理商
@synthesize mysf; //归属省份
@synthesize mycity; //归属城市
@synthesize connectman; //联系人
@synthesize connectmobile; //联系电话
@synthesize connectaddr; //联系地址
@synthesize khsf; //开户省份
@synthesize khcity; //开户城市
@synthesize psnname; //开户名
@synthesize yhkh; //银行卡号
@synthesize khh; //开户行
@synthesize appstatus; //帐号审批状态

- (void) build:(NSDictionary*)json{
    mydls=[JsonData getJsonString:json key:@"mydls"]; //归属代理商
    mysf=[JsonData getJsonString:json key:@"mysf"]; //归属省份
    mycity=[JsonData getJsonString:json key:@"mycity"]; //归属城市
    connectman=[JsonData getJsonString:json key:@"connectman"]; //联系人
    connectmobile=[JsonData getJsonString:json key:@"connectmobile"]; //联系电话
    connectaddr=[JsonData getJsonString:json key:@"connectaddr"]; //联系地址
    khsf=[JsonData getJsonString:json key:@"khsf"]; //开户省份
    khcity=[JsonData getJsonString:json key:@"khcity"]; //开户城市
    psnname=[JsonData getJsonString:json key:@"psnname"]; //开户名
    yhkh=[JsonData getJsonString:json key:@"yhkh"]; //银行卡号
    khh=[JsonData getJsonString:json key:@"khh"]; //开户行
    appstatus=[JsonData getJsonString:json key:@"appstatus"]; //帐号审批状态
}


@end


