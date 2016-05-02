//
//  ViewController.h
//  Luxa4Mac
//
//  Created by Samuel DeVore on 4/29/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
@property (weak) IBOutlet NSButton *stringIt;


- (IBAction)stringIt:(id)sender;
- (IBAction)red:(id)sender;
- (IBAction)green:(id)sender;
- (IBAction)yellow:(id)sender;
@property (weak) IBOutlet NSButton *off;
- (IBAction)off:(id)sender;
@end

