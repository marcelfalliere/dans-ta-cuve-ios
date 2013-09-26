#import <Foundation/Foundation.h>

@protocol RMMeetingRepositoryProtocol <NSObject>

- (id)currentMeeting;
- (void)updateMeeting;

@end
