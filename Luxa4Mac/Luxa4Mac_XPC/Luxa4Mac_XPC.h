//
//  Luxa4Mac_XPC.h
//  Luxa4Mac_XPC
//
//  Created by Samuel DeVore on 4/27/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Luxa4Mac_XPCProtocol.h"

// This object implements the protocol which we have defined. It provides the actual behavior for the service. It is 'exported' by the service to make it available to the process hosting the service over an NSXPCConnection.
@interface Luxa4Mac_XPC : NSObject <Luxa4Mac_XPCProtocol>
@end
