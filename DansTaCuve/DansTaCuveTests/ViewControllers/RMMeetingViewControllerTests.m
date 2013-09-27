#import <XCTest/XCTest.h>
#import "OCMock/OCMock.h"
#import "RMMeetingViewController.h"
#import "RMMeetingRepositoryProtocol.h"
#import "RMMeetingViewProtocol.h"
#import "RMMeeting.h"

@interface RMMeetingViewControllerTests : XCTestCase

@property (nonatomic) RMMeetingViewController *sut;
@property (nonatomic) RMMeetingViewController *storyboardSut;

@end

@implementation RMMeetingViewControllerTests

- (void)setUp
{
    [super setUp];
   
    self.sut = [[RMMeetingViewController alloc] init];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main"
                                                 bundle:[NSBundle bundleForClass:[RMMeetingViewController class]]];
    self.storyboardSut  = [sb instantiateViewControllerWithIdentifier:RMMeetingViewControllerStoryboardID];

    
}

- (void)tearDown
{
    self.sut = nil;
    
    [super tearDown];
}

- (void)testContructor
{
    XCTAssertNotNil(self.sut, @"RMMeetingViewController should not be nil when created");
}

- (void)testControllerHasARepository
{
    [self.storyboardSut view];
    
    XCTAssertNotNil(self.storyboardSut.meetingRepository, @"RMMeetingViewController should have a meeting repository");
}

- (void)testControllerHasView
{
    [self.storyboardSut view];

    XCTAssertNotNil(self.storyboardSut.meetingView, @"RMMeetingViewController should have a meeting view");
}


- (void)testContollerGetsCurrentMeeting
{
    id mockMeetingRepository = [OCMockObject niceMockForProtocol:@protocol(RMMeetingRepositoryProtocol)];
    self.sut.meetingRepository = mockMeetingRepository;
    
    
    [[mockMeetingRepository expect] currentMeeting];
    
    [self.sut view];
    
    [mockMeetingRepository verify];
}

- (void)testControllerUpdatesViewAtLaunch
{
    RMMeeting *aMeeting = [[RMMeeting alloc] init];
    
    id mockMeetingRepository = [OCMockObject niceMockForProtocol:@protocol(RMMeetingRepositoryProtocol)];
    [[[mockMeetingRepository stub] andReturn:aMeeting] currentMeeting];
    self.sut.meetingRepository = mockMeetingRepository;
    
    id mockMeetingView = [OCMockObject niceMockForProtocol:@protocol(RMMeetingViewProtocol)];
    [[mockMeetingView expect] updateWithMeeting:aMeeting];
    self.sut.meetingView = mockMeetingView;
    
    [self.sut view];
    
    [mockMeetingView verify];
}


@end
