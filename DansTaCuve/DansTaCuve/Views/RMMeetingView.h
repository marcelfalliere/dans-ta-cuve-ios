#import <UIKit/UIKit.h>
#import "RMMeetingViewProtocol.h"

@interface RMMeetingView : UIView <RMMeetingViewProtocol>

- (void)updateWithMeeting:(RMMeeting *)meeting;

@end
