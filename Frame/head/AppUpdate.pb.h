// Generated by the protocol buffer compiler.  DO NOT EDIT!

#import "ProtocolBuffers.h"

@class Msg_Update;
@class Msg_Update_Builder;

@interface AppUpdateRoot : NSObject {
}
+ (PBExtensionRegistry*) extensionRegistry;
+ (void) registerAllExtensions:(PBMutableExtensionRegistry*) registry;
@end

@interface Msg_Update : PBGeneratedMessage {
@private
  BOOL hasState_:1;
  BOOL hasFlag_:1;
  BOOL hasUrl_:1;
  BOOL hasContent_:1;
  int32_t state;
  int32_t flag;
  NSString* url;
  NSString* content;
}
- (BOOL) hasState;
- (BOOL) hasFlag;
- (BOOL) hasUrl;
- (BOOL) hasContent;
@property (readonly) int32_t state;
@property (readonly) int32_t flag;
@property (readonly, retain) NSString* url;
@property (readonly, retain) NSString* content;

+ (Msg_Update*) defaultInstance;
- (Msg_Update*) defaultInstance;

- (BOOL) isInitialized;
- (void) writeToCodedOutputStream:(PBCodedOutputStream*) output;
- (Msg_Update_Builder*) builder;
+ (Msg_Update_Builder*) builder;
+ (Msg_Update_Builder*) builderWithPrototype:(Msg_Update*) prototype;

+ (Msg_Update*) parseFromData:(NSData*) data;
+ (Msg_Update*) parseFromData:(NSData*) data extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Msg_Update*) parseFromInputStream:(NSInputStream*) input;
+ (Msg_Update*) parseFromInputStream:(NSInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
+ (Msg_Update*) parseFromCodedInputStream:(PBCodedInputStream*) input;
+ (Msg_Update*) parseFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;
@end

@interface Msg_Update_Builder : PBGeneratedMessage_Builder {
@private
  Msg_Update* result;
}

- (Msg_Update*) defaultInstance;

- (Msg_Update_Builder*) clear;
- (Msg_Update_Builder*) clone;

- (Msg_Update*) build;
- (Msg_Update*) buildPartial;

- (Msg_Update_Builder*) mergeFrom:(Msg_Update*) other;
- (Msg_Update_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input;
- (Msg_Update_Builder*) mergeFromCodedInputStream:(PBCodedInputStream*) input extensionRegistry:(PBExtensionRegistry*) extensionRegistry;

- (BOOL) hasState;
- (int32_t) state;
- (Msg_Update_Builder*) setState:(int32_t) value;
- (Msg_Update_Builder*) clearState;

- (BOOL) hasFlag;
- (int32_t) flag;
- (Msg_Update_Builder*) setFlag:(int32_t) value;
- (Msg_Update_Builder*) clearFlag;

- (BOOL) hasUrl;
- (NSString*) url;
- (Msg_Update_Builder*) setUrl:(NSString*) value;
- (Msg_Update_Builder*) clearUrl;

- (BOOL) hasContent;
- (NSString*) content;
- (Msg_Update_Builder*) setContent:(NSString*) value;
- (Msg_Update_Builder*) clearContent;
@end

