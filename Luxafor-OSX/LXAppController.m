//
//  LXAppController.m
//  Luxafor-OSX
//
//  Created by Aigars Silavs on 19/04/15.
//  Copyright (c) 2015 draugiem. All rights reserved.
//

#import "LXAppController.h"
#import "LXDevice.h"

@implementation LXAppController

- (instancetype)init
{
    if (self = [super init]) {
        
        CGFloat thickness = [[NSStatusBar systemStatusBar] thickness];
        self.item = [[NSStatusBar systemStatusBar] statusItemWithLength:thickness];
        self.menulet = [[LXMenulet alloc] initWithFrame:(NSRect){.size={thickness, thickness}}];
        self.menulet.delegate = self;
        [self.item setView:self.menulet];
        [self.item setHighlightMode:NO];
        
        
        NSMenu *menu = [[NSMenu alloc] init];
        NSMenuItem *menuItemClose = [menu addItemWithTitle:@"Close luxafor" action:@selector(closeApp) keyEquivalent:@""];
        [menuItemClose setTarget:self];
        
        self.item.view.menu = menu;
        
        [NSTimer scheduledTimerWithTimeInterval:2.0f
                                         target:self
                                       selector:@selector(updateIcon)
                                       userInfo:nil
                                        repeats:YES];
    }
    
    return self;
}

- (void)closeApp
{
    [NSApp terminate: nil];
}

- (void)updateIcon
{
    if ([LXDevice sharedInstance].connected == NO) {
        self.menulet.icon = nil;
    }
}

- (void)menuletClicked
{
    self.active = !self.active;
    
    if (self.active) {
        [self openPopover];
    } else {
        [self closePopover];
    }
}

- (void)popover:(id)popover didClickButtonForAction:(LXPopoverAction)action
{
    switch (action) {
            
        case LXPopoverActionGreen:
            [LXDevice sharedInstance].productivityModeEnabled = NO;
            [LXDevice sharedInstance].color = [NSColor greenColor].CGColor;
            self.menulet.icon = [NSImage imageNamed:@"status1"];
            break;
            
        case LXPopoverActionRed:
            [LXDevice sharedInstance].productivityModeEnabled = NO;
            [LXDevice sharedInstance].color = [NSColor redColor].CGColor;
            self.menulet.icon = [NSImage imageNamed:@"status2"];
            break;
            
        case LXPopoverActionProductivity:
            [LXDevice sharedInstance].productivityModeEnabled = YES;
            self.menulet.icon = [NSImage imageNamed:@"status3"];
            break;
        
        default:
            NSLog(@"Unsupported LXPopoverAction: %@", @(action));
            break;
    }
    
    [self closePopover];
}

- (void)closePopover
{
    self.active = NO;
    [self.viewController.popover performClose:self];
    [self.menulet setNeedsDisplay:YES];
}

- (void)openPopover
{
    if (!self.viewController) {
        self.viewController = [LXPopoverController new];
        self.viewController.delegate = self;
    }
    
    [self.viewController.popover showRelativeToRect:[self.menulet frame]
                                             ofView:self.menulet
                                      preferredEdge:NSMinYEdge];
    
    
    static id popoverTransiencyMonitor;
    
    if (popoverTransiencyMonitor == nil) {
        
        popoverTransiencyMonitor = [NSEvent addGlobalMonitorForEventsMatchingMask:NSLeftMouseUpMask | NSRightMouseUpMask handler:^(NSEvent* event) {
            
            [NSEvent removeMonitor:popoverTransiencyMonitor];
            popoverTransiencyMonitor = nil;
            [self closePopover];
        }];
    }
    
}

@end
