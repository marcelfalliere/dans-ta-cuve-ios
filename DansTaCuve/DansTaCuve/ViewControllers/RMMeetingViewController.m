//
//  RMMeetingViewController.m
//  DansTaCuve
//
//  Created by Raphaël on 26/09/13.
//  Copyright (c) 2013 Dans ta cuve !. All rights reserved.
//

#import "RMMeetingViewController.h"
#import "RMMeetingRepositoryProtocol.h"

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
    id meeting = [self.meetingRepository currentMeeting];
}

@end
