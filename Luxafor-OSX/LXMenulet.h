//
//  LXMenulet.h
//  Luxafor-OSX
//
//  Created by Aigars Silavs on 19/04/15.
//  Copyright (c) 2015 draugiem. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol LXMenuletDelegate <NSObject>

- (void)menuletClicked;

@end

@interface LXMenulet : NSView

@property (nonatomic, retain) NSImage *icon;
@property (nonatomic, weak) id <LXMenuletDelegate> delegate;

@end
