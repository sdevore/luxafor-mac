//
//  LXUpdater.m
//  Luxafor-OSX
//
//  Created by Aigars Silavs on 19/04/15.
//  Copyright (c) 2015 draugiem. All rights reserved.
//

#import "LXUpdater.h"

@interface LXUpdater ()

@property (nonatomic, assign) BOOL isBusy;

@end

@implementation LXUpdater

+ (LXUpdater *)sharedInstance
{
    static LXUpdater *sharedLuxaforUpdater = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedLuxaforUpdater = [self new];
    });
    return sharedLuxaforUpdater;
}


#pragma mark - Updating methods

//TODO

@end
