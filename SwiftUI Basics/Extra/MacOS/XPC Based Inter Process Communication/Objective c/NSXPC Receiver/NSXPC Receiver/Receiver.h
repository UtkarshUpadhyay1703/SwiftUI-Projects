//
//  Receiver.h
//  NSXPC Receiver
//
//  Created by admin on 4/30/24.
//

#import <Foundation/Foundation.h>

@protocol ReceiverProtocol
- (void)receiveMessage:( nonnull NSString* )message;
@end

NS_ASSUME_NONNULL_BEGIN

@interface Receiver : NSObject <NSXPCListenerDelegate, ReceiverProtocol>
- (void)listenForMessages;
@end

NS_ASSUME_NONNULL_END
