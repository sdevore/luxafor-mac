//
//  Luxa4Mac_XPC.m
//  Luxa4Mac_XPC
//
//  Created by Samuel DeVore on 4/27/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "LXDevice.h"
#import "Luxa4Mac_XPC.h"

@implementation Luxa4Mac_XPC

// This implements the example protocol. Replace the body of this class with the implementation of this service's
// protocol.
- (void)upperCaseString:(NSString *)aString withReply:(void (^)(NSString *))reply {
    NSString *response = [aString uppercaseString];
    reply(response);
}

-(void)setColor:(NSData *)newColorAsData withTransition:(int)transition withReply:(void (^)(BOOL))reply {
    
}

@end
