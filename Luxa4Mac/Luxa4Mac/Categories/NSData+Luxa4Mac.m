//
//  NSData+Luxa4Mac.m
//  Luxa4Mac
//
//  Created by Samuel DeVore on 5/1/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "NSData+Luxa4Mac.h"

@implementation NSData (Luxa4Mac)

- (nullable NSColor *)L4Mcolor {
    return (NSColor *)[NSUnarchiver unarchiveObjectWithData:self];

}
@end
