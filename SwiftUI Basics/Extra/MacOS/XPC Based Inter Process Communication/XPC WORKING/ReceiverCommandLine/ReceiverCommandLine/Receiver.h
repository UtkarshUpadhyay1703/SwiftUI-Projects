//
//  Receiver.h
//  ReceiverCommandLine
//
//  Created by admin on 8/6/24.
//

#import <Foundation/Foundation.h>

@protocol ReceiverProtocol
- (void)receiveMessage:( nonnull NSString* )message reply:(void (^_Nullable)(BOOL))reply;
@end

NS_ASSUME_NONNULL_BEGIN

@interface Receiver : NSObject<NSXPCListenerDelegate, ReceiverProtocol>
@property BOOL done;
- (void)listenForMessages;
@end

NS_ASSUME_NONNULL_END
