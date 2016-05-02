//
//  LXPopoverController.h
//  Luxafor-OSX
//
//  Created by Aigars Silavs on 19/04/15.
//  Copyright (c) 2015 draugiem. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef NS_ENUM(NSInteger, LXPopoverAction) {
    LXPopoverActionGreen = 0,
    LXPopoverActionRed = 1,
    LXPopoverActionProductivity = 2,
};

@protocol LXPopoverDelegate <NSObject>

- (void)popover:(id)popover didClickButtonForAction:(LXPopoverAction)action;

@end

@interface LXPopoverController : NSViewController

@property (nonatomic, weak) id <LXPopoverDelegate> delegate;
@property NSPopover *popover;

@end
