//
//  NSColor+Luxa4Mac.h
//  Luxa4Mac
//
//  Created by Samuel DeVore on 4/29/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//
#import "NSColor+Crayola.h"
#import "NSColor+Pantone.h"
#import <Cocoa/Cocoa.h>
@interface NSColor (Luxa4Mac)

- (nullable NSData *)L4Mdata;
+ (CGColorRef _Nullable)L4McolorToCGColor:(nonnull NSColor *)color;
@end
