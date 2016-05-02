//
//  DeviceColor.h
//  Luxa4Mac
//
//  Created by Samuel DeVore on 5/1/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DeviceColor : NSObject
- (void)isConnected:(void (^)(BOOL connected))reply;
- (void)setColor:(NSColor *)newColor withTransition:(NSInteger)transition withReply:(void (^)(BOOL connected))reply;
- (void)setColor:(NSColor *)newColor withReply:(void (^)(BOOL connected))reply;

@end
