//
//  Receiver.m
//  ReceiverCommandLine
//
//  Created by admin on 8/6/24.
//

#import "Receiver.h"

@implementation Receiver

- (void)listenForMessages
{
	NSLog(@"Receiver is listening for messages...");
	NSString *serviceIdentifier = @"com.Faronics.Receiver";
	NSXPCListener *listener = [[NSXPCListener alloc] initWithMachServiceName:serviceIdentifier];
	listener.delegate = self;
	[listener resume];
	while ((!self.done) &&
		   [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]]);
}

- (BOOL)listener:(NSXPCListener *)listener shouldAcceptNewConnection:(NSXPCConnection *)newConnection
{
	newConnection.exportedInterface = [NSXPCInterface interfaceWithProtocol:@protocol(ReceiverProtocol)];
	newConnection.exportedObject = self;
	[newConnection resume];
	return YES;
}

- (void)receiveMessage:(nonnull NSString *)message reply:(void (^ _Nullable)(BOOL))reply
{
	NSLog(@"Received message: %@", message);
	reply(YES);
}

@end
