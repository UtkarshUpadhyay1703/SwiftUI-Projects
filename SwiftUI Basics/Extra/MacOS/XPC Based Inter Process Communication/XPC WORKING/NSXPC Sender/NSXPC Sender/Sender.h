//
//  Sender.h
//  NSXPC Sender
//
//  Created by admin on 4/30/24.
//

#import <Foundation/Foundation.h>

@protocol ReceiverProtocol
- (void)receiveMessage:( nonnull NSString* )message;
@end

NS_ASSUME_NONNULL_BEGIN

@interface Sender : NSObject
- (void)sendMessage:(NSString *)message;
@end

NS_ASSUME_NONNULL_END
