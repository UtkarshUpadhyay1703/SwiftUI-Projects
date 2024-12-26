//
//  Sender.m
//  NSXPC Sender
//
//  Created by admin on 4/30/24.
//

#import "Sender.h"

@implementation Sender

- (void)sendMessage:(NSString *)message {
	NSXPCConnection *connection = [[NSXPCConnection alloc] initWithServiceName:@"com.example.ReceiverApp"];
	connection.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(ReceiverProtocol)];
	
	[connection resume];
	
	id<ReceiverProtocol> remoteObject = [connection remoteObjectProxyWithErrorHandler:^(NSError * _Nonnull error) {
		NSLog(@"Error sending message: %@", error);
	}];
	
	// This line will send the message to the receiver
	[remoteObject receiveMessage:message];
}

@end
