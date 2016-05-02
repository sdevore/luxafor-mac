//
//  ViewController.m
//  Luxa4Mac
//
//  Created by Samuel DeVore on 4/29/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "DeviceColor.h"
#import "NSColor+Luxa4Mac.h"
#import "ViewController.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)stringIt:(id)sender {
    DeviceColor *dc = [DeviceColor new];
    [dc isConnected:^(BOOL connected) {
        if (connected) {
            [dc setColor:[NSColor blackColor]
                withReply:^(BOOL connected){

                }];
        }
    }];
}

- (IBAction)red:(id)sender {
    [[DeviceColor new] setColor:[NSColor redColor]
                      withReply:^(BOOL connected){

                      }];
}

- (IBAction)green:(id)sender {
    [[DeviceColor new] setColor:[NSColor greenColor]
                      withReply:^(BOOL connected){

                      }];
}

- (IBAction)yellow:(id)sender {
    [[DeviceColor new] setColor:[NSColor yellowColor]
                      withReply:^(BOOL connected){

                      }];
}
- (IBAction)off:(id)sender {
    [[DeviceColor new] setColor:[NSColor blackColor]
                      withReply:^(BOOL connected){

                      }];
}
@end
