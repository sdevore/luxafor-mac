//
//  NSColor+Luxa4Mac.m
//  Luxa4Mac
//
//  Created by Samuel DeVore on 4/28/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "NSColor+Luxa4Mac.h"

@implementation NSColor (Luxa4Mac)
+ (CGColorRef)NSColorToCGColor:(NSColor *)color {
    NSInteger numberOfComponents = [color numberOfComponents];
    CGFloat components[numberOfComponents];
    CGColorSpaceRef colorSpace = [[color colorSpace] CGColorSpace];
    [color getComponents:(CGFloat *)&components];
    CGColorRef cgColor = CGColorCreate(colorSpace, components);

    return cgColor;
}
@end
