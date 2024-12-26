//
//  Receiver.m
//  NSXPC Receiver
//
//  Created by admin on 4/30/24.
//

#import "Receiver.h"

@implementation Receiver

- (void)listenForMessages
{
	NSLog(@"Receiver is listening for messages...");
	NSString *serviceIdentifier = @"com.Faronics.NSXPC-Receiver";
	NSXPCListener *listener = [[NSXPCListener alloc] initWithMachServiceName:serviceIdentifier];
	listener.delegate = self;
	[listener resume];
}

- (BOOL)listener:(NSXPCListener *)listener shouldAcceptNewConnection:(NSXPCConnection *)newConnection
{
	newConnection.exportedInterface = [NSXPCInterface interfaceWithProtocol:@protocol(ReceiverProtocol)];
	newConnection.exportedObject = self;
	[newConnection resume];
	return YES;
}

- (void)receiveMessage:(NSString *)message
{
	NSLog(@"Received message: %@", message);
}

@end
