#import <XCTest/XCTest.h>
#import "OCMock/OCMock.h"
#import "RMFileBasedMeetingRepository.h"
#import "RMMeeting.h"


@interface RMFileBasedMeetingRepository (TestExtension)

- (RMMeeting *)unarchiveCurrentMeeting;

@end

@interface RMFileBasedMeetingRepositoryTests : XCTestCase

@end

@implementation RMFileBasedMeetingRepositoryTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testRepositoryReadsFromNSUserDefaultsFirstTime
{
    RMFileBasedMeetingRepository *sut = [[RMFileBasedMeetingRepository alloc] init];
    
    RMMeeting *expectedMeeting = [[RMMeeting alloc] init];
    
    id mockSut = [OCMockObject partialMockForObject:sut];
    [[[mockSut stub] andReturn:expectedMeeting] unarchiveCurrentMeeting];

    RMMeeting *resultMeeting = [sut currentMeeting];

    
    XCTAssertEqualObjects(expectedMeeting, resultMeeting, @"First call to currentMeeting should read from NSUserDefaults");
}

- (void)testRepositoryDoesNotReadFromNSUserDefaults
{
    RMFileBasedMeetingRepository *sut = [[RMFileBasedMeetingRepository alloc] init];
    
    RMMeeting *expectedMeeting = [[RMMeeting alloc] init];
    
    id mockSut = [OCMockObject partialMockForObject:sut];
    [[[mockSut stub] andReturn:expectedMeeting] unarchiveCurrentMeeting];
    
    RMMeeting *resultMeeting = [sut currentMeeting];
    [mockSut stopMocking];

    mockSut = [OCMockObject partialMockForObject:sut];
    [[mockSut reject] unarchiveCurrentMeeting];
    
    resultMeeting = [mockSut currentMeeting];
    
    [mockSut verify];
    
    XCTAssertEqualObjects(expectedMeeting, resultMeeting, @"second call to currentMeeting should not read from NSUserDefaults");
}




@end
