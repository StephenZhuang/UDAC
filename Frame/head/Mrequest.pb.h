// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

@class Msg_Request;
@class Msg_Request_Builder;
@class Msg_Request_Msg_Post;
@class Msg_Request_Msg_Post_Builder;

@interface MrequestRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface Msg_Request : PBGeneratedMessage {
@private
  BOOL hasRequestMessage_:1;
  NSData* requestMessage;
  NSMutableArray* mutablePostsList;
}
- (BOOL) hasRequestMessage;
@property (readonly, retain) NSData* requestMessage;
- (NSArray*) postsList;
- (Msg_Request_Msg_Post*) postsAtIndex:(int32_t) index;

+ (Msg_Request*) defaultInstance;
- (Msg_Request*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (Msg_Request_Builder*) builder;
+ (Msg_Request_Builder*) builder;
+ (Msg_Request_Builder*) builderWithPrototype:(Msg_Request*) prototype;

+ (Msg_Request*) parseFromData:(NSData*) data;
+ (Msg_Request*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Msg_Request*) parseFromInputStream:(NSInputStream*) input;
+ (Msg_Request*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Msg_Request*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (Msg_Request*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface Msg_Request_Msg_Post : PBGeneratedMessage {
@private
  BOOL hasName_:1;
  BOOL hasValue_:1;
  NSString* name;
  NSString* value;
}
- (BOOL) hasName;
- (BOOL) hasValue;
@property (readonly, retain) NSString* name;
@property (readonly, retain) NSString* value;

+ (Msg_Request_Msg_Post*) defaultInstance;
- (Msg_Request_Msg_Post*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (Msg_Request_Msg_Post_Builder*) builder;
+ (Msg_Request_Msg_Post_Builder*) builder;
+ (Msg_Request_Msg_Post_Builder*) builderWithPrototype:(Msg_Request_Msg_Post*) prototype;

+ (Msg_Request_Msg_Post*) parseFromData:(NSData*) data;
+ (Msg_Request_Msg_Post*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Msg_Request_Msg_Post*) parseFromInputStream:(NSInputStream*) input;
+ (Msg_Request_Msg_Post*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Msg_Request_Msg_Post*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (Msg_Request_Msg_Post*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface Msg_Request_Msg_Post_Builder : PBGeneratedMessage_Builder {
@private
  Msg_Request_Msg_Post* result;
}

- (Msg_Request_Msg_Post*) defaultInstance;

- (Msg_Request_Msg_Post_Builder*) clear;
- (Msg_Request_Msg_Post_Builder*) clone;

- (Msg_Request_Msg_Post*) build;
- (Msg_Request_Msg_Post*) buildPartial;

- (Msg_Request_Msg_Post_Builder*) mergeFrom:(Msg_Request_Msg_Post*) other;
- (Msg_Request_Msg_Post_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (Msg_Request_Msg_Post_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasName;
- (NSString*) name;
- (Msg_Request_Msg_Post_Builder*) setName:(NSString*) value;
- (Msg_Request_Msg_Post_Builder*) clearName;

- (BOOL) hasValue;
- (NSString*) value;
- (Msg_Request_Msg_Post_Builder*) setValue:(NSString*) value;
- (Msg_Request_Msg_Post_Builder*) clearValue;
@end

@interface Msg_Request_Builder : PBGeneratedMessage_Builder {
@private
  Msg_Request* result;
}

- (Msg_Request*) defaultInstance;

- (Msg_Request_Builder*) clear;
- (Msg_Request_Builder*) clone;

- (Msg_Request*) build;
- (Msg_Request*) buildPartial;

- (Msg_Request_Builder*) mergeFrom:(Msg_Request*) other;
- (Msg_Request_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (Msg_Request_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (NSArray*) postsList;
- (Msg_Request_Msg_Post*) postsAtIndex:(int32_t) index;
- (Msg_Request_Builder*) replacePostsAtIndex:(int32_t) index with:(Msg_Request_Msg_Post*) value;
- (Msg_Request_Builder*) addPosts:(Msg_Request_Msg_Post*) value;
- (Msg_Request_Builder*) addAllPosts:(NSArray*) values;
- (Msg_Request_Builder*) clearPostsList;

- (BOOL) hasRequestMessage;
- (NSData*) requestMessage;
- (Msg_Request_Builder*) setRequestMessage:(NSData*) value;
- (Msg_Request_Builder*) clearRequestMessage;
@end

