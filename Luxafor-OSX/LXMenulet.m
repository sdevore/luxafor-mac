//
//  LXMenulet.m
//  Luxafor-OSX
//
//  Created by Aigars Silavs on 19/04/15.
//  Copyright (c) 2015 draugiem. All rights reserved.
//

#import "LXMenulet.h"

@implementation LXMenulet

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];

    NSImage *image = _icon ? _icon : [NSImage imageNamed:@"status0"];

    [image drawInRect:NSInsetRect(rect, 2, 2)
             fromRect:NSZeroRect
            operation:NSCompositeSourceOver
             fraction:1.0];
}

- (void)setIcon:(NSImage *)icon
{
    _icon = icon;
    [self setNeedsDisplay:YES];
}
/*
- (void)rightMouseDown:(NSEvent *)theEvent
{
    [self.delegate menuletClicked];
}
*/
- (void)otherMouseDown:(NSEvent *)theEvent
{
    [self.delegate menuletClicked];
}

- (void)mouseDown:(NSEvent *)theEvent
{
    [self.delegate menuletClicked];
}

@end
