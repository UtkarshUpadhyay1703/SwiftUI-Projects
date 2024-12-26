//
//  AppDelegate.m
//  NSXPC Sender
//
//  Created by admin on 4/30/24.
//

//#import "AppDelegate.h"
//
//@interface AppDelegate ()
//
//
//@end
//
//@implementation AppDelegate
//
//- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
//	// Insert code here to initialize your application
//}
//
//
//- (void)applicationWillTerminate:(NSNotification *)aNotification {
//	// Insert code here to tear down your application
//}
//
//
//- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
//	return YES;
//}
//
//
//@end


#import "AppDelegate.h"
#import "Sender.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application
	Sender *sender = [[Sender alloc] init];
	[sender sendMessage:@"Hello Receiver!"];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
	// Insert code here to tear down your application
}

@end
