#import "RMFileBasedMeetingRepository.h"

@interface RMFileBasedMeetingRepository ()

@property (nonatomic) RMMeeting *meeting;

@end

@implementation RMFileBasedMeetingRepository

- (RMMeeting *)currentMeeting
{   
    if (self.meeting == nil)
    {
        self.meeting = [self unarchiveCurrentMeeting];
    }
    return self.meeting;
}

- (RMMeeting *)unarchiveCurrentMeeting
{
    return nil;
}

@end
