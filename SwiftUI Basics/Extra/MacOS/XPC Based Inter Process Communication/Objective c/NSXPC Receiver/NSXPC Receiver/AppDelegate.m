//
//  AppDelegate.m
//  NSXPC Receiver
//
//  Created by admin on 4/30/24.
//

#import "AppDelegate.h"
#import "Receiver.h"

@interface AppDelegate ()


@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application
	Receiver *receiver = [[Receiver alloc] init];
	[receiver listenForMessages];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
	// Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
	return YES;
}


@end
