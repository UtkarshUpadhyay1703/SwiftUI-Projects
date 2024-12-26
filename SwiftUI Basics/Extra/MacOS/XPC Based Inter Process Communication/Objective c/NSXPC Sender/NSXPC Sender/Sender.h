//
//  Sender.h
//  NSXPC Sender
//
//  Created by admin on 4/30/24.
//

#import <Foundation/Foundation.h>

@protocol Service
- (void)getValueUsingService:(void (^_Nullable)(NSString *_Nullable))reply;
@end

@protocol ReceiverProtocol
- (void)receiveMessage:( nonnull NSString* )message reply:(void (^_Nullable)(BOOL))reply;
- (void)connectToNewService: (void (^_Nullable)(id<Service>_Nullable))reply;
@end

NS_ASSUME_NONNULL_BEGIN

@interface Sender : NSObject
- (void)sendMessage:(NSString *)message;
@end

NS_ASSUME_NONNULL_END
