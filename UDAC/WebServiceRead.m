//
//  IntenetRead.m
//  protobufTest
//
//  Created by lu liu on 12-7-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "WebServiceRead.h"
#import "Frame.h"
#define DEFAULT_NAMESPACE @"http://pub.webservice.shqj.com"
#define DEFAULT_URL @"http://117.135.154.87:7777/axis2/services/QJService?wsdl"

@implementation WebServiceRead

@synthesize conn;
@synthesize receivedData;

@synthesize delegate;
@synthesize mselector;
@synthesize showLoading;

-(id)init:(id)ndelegate selecter:(SEL) selecter{
    self=[super init];
    if(self){
        delegate=ndelegate;
        mselector=selecter;
        showLoading = NO;
    }
    return self;
}

- (void)postWithMethodName:(NSString *)methodName params:(NSDictionary *)params
{
    [self post:methodName namespace:DEFAULT_NAMESPACE url:DEFAULT_URL params:params];
}

-(void)post:(NSString*)methodname namespace:(NSString*)namespace url:(NSString *)surl params:(NSDictionary*)params{
    if (showLoading) {
        [ProgressHUD show:@"加载中…"];
    }
    receivedData=[[NSMutableData alloc]init];
    // 设置我们之后解析XML时用的关键字，与响应报文中Body标签之间的getMobileCodeInfoResult标签对应
    // 创建SOAP消息，内容格式就是网站上提示的请求报文的实体主体部分
    NSMutableString *soapMsg = [NSMutableString stringWithFormat:
                         @"<soap:Envelope xmlns:soap=\"http://www.w3.org/2003/05/soap-envelope\" xmlns:pub=\"%@\">"
                         "<soap:Header/>"
                         "<soap:Body>"
                         "<pub:%@>",namespace,methodname];
    
    

        NSArray *keys=[params allKeys];
        NSString* key,*value;
        for(int i=0;i<[keys count];i++){
            key = [keys objectAtIndex: i];
            value = [params objectForKey: key];
            [soapMsg appendString:[NSString stringWithFormat:@"<pub:%@>%@</pub:%@>",key,value,key]];
        }
    
    
    [soapMsg appendString:[NSString stringWithFormat:@"</pub:%@>"
                                                    "</soap:Body>"
                                                    "</soap:Envelope>" ,methodname]];
    
    // 将这个XML字符串打印出来
    NSLog(@"%@", soapMsg);
    // 创建URL，内容是前面的请求报文报文中第二行主机地址加上第一行URL字段
    NSURL *url = [NSURL URLWithString:surl];
    // 根据上面的URL创建一个请求
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMsg length]];
    // 添加请求的详细信息，与请求报文前半部分的各字段对应
    [req addValue:@"application/soap+xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [req addValue:msgLength forHTTPHeaderField:@"Content-Length"];
    // 设置请求行方法为POST，与请求报文第一行对应
    [req setHTTPMethod:@"POST"];
    // 将SOAP消息加到请求中
    [req setHTTPBody: [soapMsg dataUsingEncoding:NSUTF8StringEncoding]];
    // 创建连接
    //    conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    //    if (conn) {
    //        [NSMutableData data];
    //    }
    conn=[[NSURLConnection alloc]initWithRequest:req delegate:self];
}


-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    [ProgressHUD showError:@"连接失败"];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [receivedData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    if (showLoading) {
//        dispatch_time_t t= dispatch_time(DISPATCH_TIME_NOW, 6);
//        dispatch_after(t, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
//            [ProgressHUD showError:@""];
//        });
    }
    NSMutableString* result=
    [[NSMutableString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
     NSRange reagestart=[result rangeOfString:@"<ns:return>"];
    if (reagestart.location != NSNotFound) {
        NSString *s2 = [result substringFromIndex:reagestart.location+11];
        
        NSRange reageend=[s2 rangeOfString:@"</ns:return>"];
        if (reageend.location != NSNotFound) {
            NSString * res = [s2 substringWithRange:NSMakeRange(0,reageend.location) ];
            if([res hasPrefix:@"["]) {
                res=[NSString stringWithFormat:@"{\"data\":%@}" ,res];
            }
            @try{
                if(delegate && [delegate respondsToSelector:mselector]){
                    [delegate performSelector:mselector withObject:res ];
                }
            }@catch (NSException *e) {
                
            }
        }
       
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
}

-(void)stop{
    if(conn !=nil){
        [conn cancel];
    }
}
@end
