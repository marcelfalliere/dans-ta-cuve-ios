#import "RMMeetingViewController.h"
#import "RMMeetingRepositoryProtocol.h"
#import "RMMeetingViewProtocol.h"

NSString *RMMeetingViewControllerStoryboardID = @"MeetingViewController";

@interface RMMeetingViewController ()

@end

@implementation RMMeetingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    RMMeeting *meeting = [self.meetingRepository currentMeeting];

    [self.meetingView updateWithMeeting:meeting];
}

@end
