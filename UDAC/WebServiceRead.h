//
//  IntenetRead.h
//  protobufTest
//
//  Created by lu liu on 12-7-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(NSString *data);

@interface WebServiceRead : NSObject

@property (strong, nonatomic) NSURLConnection *conn;
@property (strong, nonatomic) NSMutableData *receivedData;
@property (nonatomic , assign) BOOL showLoading;
@property (assign, nonatomic) id delegate;
@property SEL mselector;
@property (nonatomic , copy) SuccessBlock successBlock;

- (void)postWithMethodName:(NSString *)methodName params:(NSDictionary *)params;
-(void)post:(NSString*)methodname namespace:(NSString*)namespace url:(NSString *)surl params:(NSDictionary*)params;

-(void)stop;
-(id)init:(id)ndelegate selecter:(SEL) selecter;
- (id)initWithBlock:(SuccessBlock)block;
@end
