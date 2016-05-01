//
//  Luxa4MacXPC.h
//  Luxa4MacXPC
//
//  Created by Samuel DeVore on 4/29/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Luxa4MacXPCProtocol.h"

// This object implements the protocol which we have defined. It provides the actual behavior for the service. It is 'exported' by the service to make it available to the process hosting the service over an NSXPCConnection.
@interface Luxa4MacXPC : NSObject <Luxa4MacXPCProtocol>
@end
