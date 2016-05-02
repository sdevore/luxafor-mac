//
//  DeviceTests.m
//  Luxa4Mac
//
//  Created by Samuel DeVore on 5/1/16.
//  Copyright © 2016 Samuel DeVore. All rights reserved.
//

#import "DeviceColor.h"
#import <XCTest/XCTest.h>
#import "OCMock.h"
@interface DeviceTests : XCTestCase

@end

@implementation DeviceTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testConnected {
    XCTestExpectation *expectation = [self expectationWithDescription:@"connected"];
    id dc = OCMClassMock([DeviceColor class]);
    OCMStub([dc isConnected:([OCMArg invokeBlockWithArgs:@YES, nil])]);
    [dc isConnected:^(BOOL connected) {
        XCTAssertTrue(connected);
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:10
                                 handler:^(NSError *_Nullable error) {
                                     if (error != nil) {
                                         XCTAssert(NO, @"returned Error: %@", error);
                                     }

                                 }];
}

- (void)testColorRed {
    XCTestExpectation *expectation = [self expectationWithDescription:@"red"];
    id dc = OCMClassMock([DeviceColor class]);
    OCMStub([dc setColor:[OCMArg anyPointer] withReply:([OCMArg invokeBlockWithArgs:@YES, nil])]);
    [dc setColor:[NSColor redColor]
        withReply:^(BOOL connected) {
            XCTAssertTrue(connected);
            [expectation fulfill];
        }];

    [self waitForExpectationsWithTimeout:4
                                 handler:^(NSError *_Nullable error) {
                                     if (error != nil) {
                                         XCTAssert(NO, @"returned Error: %@", error);
                                     }

                                 }];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
