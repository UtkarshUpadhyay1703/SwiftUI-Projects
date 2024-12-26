//
//  main.m
//  ReceiverCommandLine
//
//  Created by admin on 8/6/24.
//

#import <Foundation/Foundation.h>
#import "Receiver.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    // insert code here...
	    NSLog(@"Hello, World!");
		Receiver *receiver = [[Receiver alloc] init];
		receiver.done = NO;
		[receiver listenForMessages];
	}
	return 0;
}
