//
//  DeviceColor.m
//  Luxa4Mac
//
//  Created by Samuel DeVore on 5/1/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "DeviceColor.h"
#import "Luxa4MacXPCProtocol.h"
@implementation DeviceColor
- (void)isConnected:(void (^)(BOOL connected))reply {
    NSXPCConnection *stringService = [[NSXPCConnection alloc] initWithServiceName:@"com.scidsolutions.Luxa4MacXPC"];

    // The fetch-service will implement the 'Fetch' protocol.
    stringService.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(Luxa4MacXPCProtocol)];

    // This object will implement the 'FetchProgress' protocol, so the Fetcher can report progress back and we can
    // display it to the user.
    [stringService resume];
    [[stringService remoteObjectProxy] isDeviceConnected:^(BOOL connected) {
        if (nil != reply) {
            reply(connected);
        }
    }];
}
- (void)setColor:(NSColor *)newColor withReply:(void (^)(BOOL connected))reply {
    [self setColor:newColor
        withTransition:0
             withReply:^(BOOL connected) {
                 reply(connected);
             }];
}
- (void)setColor:(NSColor *)newColor withTransition:(NSInteger)transition withReply:(void (^)(BOOL connected))reply {
    NSXPCConnection *stringService = [[NSXPCConnection alloc] initWithServiceName:@"com.scidsolutions.Luxa4MacXPC"];

    // The fetch-service will implement the 'Fetch' protocol.
    stringService.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(Luxa4MacXPCProtocol)];

    // This object will implement the 'FetchProgress' protocol, so the Fetcher can report progress back and we can
    // display it to the user.
    [stringService resume];
    [[stringService remoteObjectProxy] setColorData:[newColor L4Mdata]
                                     withTransition:transition
                                          withReply:^(BOOL completed) {
                                              if (nil != reply) {
                                                  reply(completed);
                                              }
                                          }];
}

@end
