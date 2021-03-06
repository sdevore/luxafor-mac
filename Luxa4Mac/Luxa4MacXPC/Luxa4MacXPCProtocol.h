//
//  Luxa4MacXPCProtocol.h
//  Luxa4MacXPC
//
//  Created by Samuel DeVore on 4/29/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "NSColor+Luxa4Mac.h"

#import <Foundation/Foundation.h>
// The protocol that this service will vend as its API. This header file will also need to be visible to the process
// hosting the service.
@protocol Luxa4MacXPCProtocol

// Replace the API of this protocol with an API appropriate to the service you are vending.
- (void)upperCaseString:(NSString *)aString withReply:(void (^)(NSString *))reply;

- (void)isDeviceConnected:(void (^)(BOOL connected))reply;

- (void)setColorData:(NSData *)newColorAsData
      withTransition:(NSInteger)transition
           withReply:(void (^)(BOOL completed))reply;
@end

@protocol Luxa4MacXPCReportingProtocol

- (void)updateProgress:(double)currentProgress;
- (void)finished;

@end

/*
 To use the service from an application or other process, use NSXPCConnection to establish a connection to the service
by doing something like this:

     _connectionToService = [[NSXPCConnection alloc] initWithServiceName:@"com.scidsolutions.Luxa4MacXPC"];
     _connectionToService.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(StringModifing)];
     [_connectionToService resume];

Once you have a connection to the service, you can use it like this:

     [[_connectionToService remoteObjectProxy] upperCaseString:@"hello" withReply:^(NSString *aString) {
         // We have received a response. Update our text field, but do it on the main thread.
         NSLog(@"Result string was: %@", aString);
     }];

 And, when you are finished with the service, clean up the connection like this:

     [_connectionToService invalidate];
*/
