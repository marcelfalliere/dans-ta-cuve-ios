#import <Foundation/Foundation.h>

@class RMMeeting;

@protocol RMMeetingViewProtocol <NSObject>

- (void)updateWithMeeting:(RMMeeting *)meeting;

@end
