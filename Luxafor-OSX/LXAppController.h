//
//  LXAppController.h
//  Luxafor-OSX
//
//  Created by Aigars Silavs on 19/04/15.
//  Copyright (c) 2015 draugiem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LXMenulet.h"
#import "LXPopoverController.h"

@interface LXAppController : NSObject <LXPopoverDelegate, LXMenuletDelegate>

@property (nonatomic, retain) LXPopoverController *viewController;
@property (nonatomic, retain) LXMenulet *menulet;
@property (nonatomic, retain) NSStatusItem *item;
@property (nonatomic) BOOL active;

@end
