//
//  main.m
//  XPCObjectiveCServer
//
//  Created by admin on 4/26/24.
//

#import <Foundation/Foundation.h>

@protocol XPCServerProtocol
- (void)processMessage:(NSString *)message;
@end

@interface XPCServer : NSObject <XPCServerProtocol, NSXPCListenerDelegate>
@end

@implementation XPCServer {
	NSXPCListener *_listener;
}

- (BOOL)listener:(NSXPCListener *)listener shouldAcceptNewConnection:(NSXPCConnection *)newConnection {
	newConnection.exportedInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCServerProtocol)];
	newConnection.exportedObject = self;
	[newConnection resume];
	return YES;
}

- (void)processMessage:(NSString *)message {
	NSLog(@"Received message: %@", message);
}

- (void)start {
	_listener = [[NSXPCListener alloc] initWithMachServiceName:@"com.faronics.XPCServerService"];
	_listener.delegate = self;
	[_listener resume];
}

@end

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		XPCServer *server = [[XPCServer alloc] init];
		[server start];

		// Perform client tasks
		NSXPCConnection *connection = [[NSXPCConnection alloc] initWithServiceName:@"xyz"];
		connection.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCServerProtocol)];
		[connection resume];

		id<XPCServerProtocol> proxy = [connection remoteObjectProxyWithErrorHandler:^(NSError * _Nonnull error) {
			NSLog(@"Error: %@", error);
		}];

		NSString *message = @"Hello from XPCClient!";
		[proxy processMessage:message];
		NSLog(@"Sent message to server");

		// Enter the run loop
		[[NSRunLoop currentRunLoop] run];
	}
	return 0;
}
