#import <Foundation/Foundation.h>

@class RMMeeting;

@protocol RMMeetingRepositoryProtocol <NSObject>

- (RMMeeting *)currentMeeting;

@end
