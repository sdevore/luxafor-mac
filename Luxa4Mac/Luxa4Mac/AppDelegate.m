//
//  AppDelegate.m
//  Luxa4Mac
//
//  Created by Samuel DeVore on 4/29/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "AppDelegate.h"
#import "DMKevlarApplication.h"
#import <DevMateKit/DevMateKit.h>
@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    DMKitDebugAddActivationMenu();
    [DevMateKit sendTrackingReport:nil delegate:nil];
    
    if (!DMKIsApplicationActivated(NULL)) {
        [DevMateKit setupTimeTrial:nil withTimeInterval:kDMTrialWeek];
    }
   }

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (IBAction)startActivationProcess:(id)sender {
    if (!DMKIsApplicationActivated(NULL)) {
        [DevMateKit runActivationDialog:nil inMode:DMActivationModeFloating];
    }
}

- (IBAction)showFeedbackDialog:(id)sender {
    [DevMateKit showFeedbackDialog:nil inMode:DMFeedbackIndependentMode];
}

@end
