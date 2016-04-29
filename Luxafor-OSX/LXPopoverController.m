//
//  LXPopoverController.m
//  Luxafor-OSX
//
//  Created by Aigars Silavs on 19/04/15.
//  Copyright (c) 2015 draugiem. All rights reserved.
//

#import "LXPopoverController.h"

@interface LXPopoverController ()

@end

@implementation LXPopoverController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.popover = [[NSPopover alloc] init];
        self.popover.contentViewController = self;
    }
    return self;
}

- (IBAction)buttonGreenTapped:(NSButton *)sender
{
    [self.delegate popover:self didClickButtonForAction:LXPopoverActionGreen];
}

- (IBAction)buttonRedTapped:(NSButton *)sender
{
    [self.delegate popover:self didClickButtonForAction:LXPopoverActionRed];
}

- (IBAction)buttonProductivityTapped:(NSButton *)sender
{
    [self.delegate popover:self didClickButtonForAction:LXPopoverActionProductivity];
}

@end
