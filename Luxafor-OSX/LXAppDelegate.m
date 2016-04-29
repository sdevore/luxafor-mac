//
//  AppDelegate.m
//  Luxafor-OSX
//
//  Created by Aigars Silavs on 12/04/15.
//  Copyright (c) 2015 draugiem. All rights reserved.
//

#import "LXAppDelegate.h"
#import "LXAppController.h"

@interface LXAppDelegate ()

@property (nonatomic, retain) LXAppController *appController;

@end

@implementation LXAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.appController = [LXAppController new];
    
    //Luxafor app should launch at login by default
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"InitialLoginLaunchStatus"]) {
        [self addToLoginItems];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"InitialLoginLaunchStatus"];
    }
}

- (void)addToLoginItems
{
    LSSharedFileListRef loginItems = LSSharedFileListCreate(NULL, kLSSharedFileListSessionLoginItems, NULL);
    if (loginItems == NULL) {
        return;
    }
    
    LSSharedFileListItemRef loginItem = LSSharedFileListInsertItemURL(loginItems,
                                                                      kLSSharedFileListItemLast,
                                                                      NULL,
                                                                      NULL,
                                                                      (__bridge CFURLRef)[NSBundle mainBundle].bundleURL,
                                                                      NULL,
                                                                      NULL);
    
    if (loginItem != NULL) {
        CFRelease(loginItem);
    }
    
    CFRelease(loginItems);
}

@end
