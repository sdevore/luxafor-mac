//
//  AppDelegate.m
//  Luxa4Mac
//
//  Created by Samuel DeVore on 4/27/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "AppDelegate.h"
#import "DMKevlarApplication.h"
#import <CocoaLumberjack/CocoaLumberjack.h>
#import <DevMateKit/DevMateKit.h>
// Log levels: off, error, warn, info, verbose
#import "XCDLumberjackNSLogger.h"

#ifdef DEBUG
static const DDLogLevel ddLogLevel = DDLogLevelVerbose;
#else
static const DDLogLevel ddLogLevel = DDLogLevelWarn;
#endif
@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    DMKitDebugAddDevMateMenu();
    [DevMateKit sendTrackingReport:nil delegate:nil];
    [DevMateKit setupIssuesController:nil reportingUnhandledIssues:YES];
    if (!DMKIsApplicationActivated(NULL)) {
        [DevMateKit setupTimeTrial:nil withTimeInterval:kDMTrialWeek];
    }
    [DDLog addLogger:[DDTTYLogger sharedInstance]]; // TTY = Xcode console
    [DDLog addLogger:[DDASLLogger sharedInstance]]; // ASL = Apple System Logs
    XCDLumberjackNSLogger *logger = [XCDLumberjackNSLogger new];
    [DDLog addLogger:logger withLevel:DDLogLevelAll]; // normally DDLogLevelWarning | DDLogLevelErrorn
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    [[DDTTYLogger sharedInstance] setForegroundColor:[NSColor greenColor] backgroundColor:nil forFlag:DDLogFlagDebug];
    [[DDTTYLogger sharedInstance] setForegroundColor:[NSColor blueColor] backgroundColor:nil forFlag:DDLogFlagInfo];


    DDLogVerbose(@"Verbose");
    DDLogDebug(@"Debug");
    DDLogInfo(@"Info");
    DDLogWarn(@"Warn");
    DDLogError(@"Error");
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
