#import <Foundation/Foundation.h>
#import "RMMeetingRepositoryProtocol.h"

@interface RMFileBasedMeetingRepository : NSObject <RMMeetingRepositoryProtocol>

- (RMMeeting *)currentMeeting;

@end
