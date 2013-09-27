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
    NSString *meetingFilePath = [self meetingFilePath];
    
    RMMeeting *currentMeeting = [NSKeyedUnarchiver unarchiveObjectWithFile:meetingFilePath];
    
    return currentMeeting;
}

- (void)archiveCurrentMeeting
{
    NSString *meetingFilePath = [self meetingFilePath];
    
    [NSKeyedArchiver archiveRootObject:self.currentMeeting toFile:meetingFilePath];
}

- (NSString *)meetingFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *meetingFilePath = [documentsDirectory stringByAppendingPathComponent:@"currentmeeting.keyedarchive"];
    return meetingFilePath;
}

@end
