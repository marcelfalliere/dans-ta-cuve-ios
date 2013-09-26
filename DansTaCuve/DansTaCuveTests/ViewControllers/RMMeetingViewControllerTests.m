//
//  RMMeetingViewControllerTests.m
//  DansTaCuve
//
//  Created by Raphaël on 26/09/13.
//  Copyright (c) 2013 Dans ta cuve !. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OCMock/OCMock.h"
#import "RMMeetingViewController.h"
#import "RMMeetingRepositoryProtocol.h"

@interface RMMeetingViewControllerTests : XCTestCase

@property (nonatomic) RMMeetingViewController *sut;

@end

@implementation RMMeetingViewControllerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
    self.sut = [[RMMeetingViewController alloc] init];
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testContructor
{
    XCTAssertNotNil(self.sut, @"RMMeetingViewController should not be nil when created");
}

- (void) testContollerGetsCurrentMeeting
{
    id mockMeetingStore = [OCMockObject niceMockForProtocol:@protocol(RMMeetingRepositoryProtocol)];
    self.sut.meetingRepository = mockMeetingStore;
    
    
    [[mockMeetingStore expect] currentMeeting];
    
    [self.sut view];
    
    [mockMeetingStore verify];
}

@end
