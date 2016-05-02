//
//  Luxa4MacXPC.m
//  Luxa4MacXPC
//
//  Created by Samuel DeVore on 4/29/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "Luxa4MacXPC.h"
#import "NSData+Luxa4Mac.h"
#import <CocoaLumberjack/CocoaLumberjack.h>
// Log levels: off, error, warn, info, verbose
#import "LXDevice.h"
#import "XCDLumberjackNSLogger.h"
#ifdef DEBUG
static const DDLogLevel ddLogLevel = DDLogLevelVerbose;
#else
static const DDLogLevel ddLogLevel = DDLogLevelWarn;
#endif

@implementation Luxa4MacXPC

// This implements the example protocol. Replace the body of this class with the implementation of this service's
// protocol.
- (void)upperCaseString:(NSString *)aString withReply:(void (^)(NSString *))reply {
    NSString *response = [aString uppercaseString];
    DDLogVerbose(@"aString: %@ response:%@", aString, response);
    if (nil != reply) {
        reply(response);
    }
}

- (void)isDeviceConnected:(void (^)(BOOL))reply {
    BOOL connected = [LXDevice sharedInstance].connected;
    if (nil != reply) {
        reply(connected);
    }
}

- (void)setColorData:(NSData *)newColorAsData withTransition:(NSInteger)transition withReply:(void (^)(BOOL))reply {
    BOOL connected = [LXDevice sharedInstance].connected;
    if (connected) {
        NSColor *newColor = [(NSData *)newColorAsData L4Mcolor];
        [LXDevice sharedInstance].transitionSpeed = [[NSNumber numberWithInteger:transition] charValue];
        [LXDevice sharedInstance].productivityModeEnabled = NO;
        [LXDevice sharedInstance].color = newColor.CGColor;
    }
    if (nil != reply) {
        reply(connected);
    }
}

@end
