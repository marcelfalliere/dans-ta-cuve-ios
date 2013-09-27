#import <UIKit/UIKit.h>

@protocol RMMeetingRepositoryProtocol;
@protocol RMMeetingViewProtocol;

extern NSString *RMMeetingViewControllerStoryboardID;

@interface RMMeetingViewController : UIViewController

@property (nonatomic) IBOutlet id<RMMeetingViewProtocol>        meetingView;
@property (nonatomic) IBOutlet id<RMMeetingRepositoryProtocol>  meetingRepository;



@end
