//
//  Luxa4MacXPC.m
//  Luxa4MacXPC
//
//  Created by Samuel DeVore on 4/29/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "Luxa4MacXPC.h"

@implementation Luxa4MacXPC

// This implements the example protocol. Replace the body of this class with the implementation of this service's protocol.
- (void)upperCaseString:(NSString *)aString withReply:(void (^)(NSString *))reply {
    NSString *response = [aString uppercaseString];
    reply(response);
}

@end
