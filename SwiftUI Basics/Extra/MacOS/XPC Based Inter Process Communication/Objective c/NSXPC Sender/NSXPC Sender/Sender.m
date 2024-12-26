//
//  Sender.m
//  NSXPC Sender
//
//  Created by admin on 4/30/24.
//

#import "Sender.h"

@implementation Sender

- (void)sendMessage:(NSString *)message
{
	NSString *serviceIdentifier = @"com.Faronics.Receiver";
	NSXPCConnection *connection = [[NSXPCConnection alloc] initWithMachServiceName:serviceIdentifier options:NSXPCConnectionPrivileged];
	
	NSXPCInterface *serviceFactoryInterface = [NSXPCInterface interfaceWithProtocol:@protocol(ReceiverProtocol)];
		NSXPCInterface *serviceInterface = [NSXPCInterface interfaceWithProtocol:@protocol(Service)];
	
	
	// connection has to be returned as proxy, not as a copy
 [serviceFactoryInterface setInterface: serviceInterface
					   forSelector: @selector(connectToNewService:)
					 argumentIndex: 0
					   ofReply: YES];
	
	
	connection.remoteObjectInterface = serviceFactoryInterface;
	
	[connection resume];
	
	id<ReceiverProtocol> remoteObject = [connection remoteObjectProxyWithErrorHandler:^(NSError * _Nonnull error) {
		NSLog(@"Error sending message: %@", error);
	}];
//
//	// This line will send the message to the receiver
//	[remoteObject receiveMessage:message reply:^(BOOL status) {
//		NSLog(@"Reply status = %d", status);
//	}];
	
	[remoteObject connectToNewService:^(id<Service> newService) {
		for (NSInteger i = 0; i <= 10; i++)
		{
			[newService getValueUsingService:^(NSString * newValue) {
				NSLog(@"newService.incrementValue = %@", newValue);
			}];
		}
			[connection invalidate];

		}];
}

@end
