//
//  RMMeetingViewController.h
//  DansTaCuve
//
//  Created by Raphaël on 26/09/13.
//  Copyright (c) 2013 Dans ta cuve !. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RMMeetingRepositoryProtocol;

@interface RMMeetingViewController : UIViewController

@property (nonatomic) id<RMMeetingRepositoryProtocol> meetingRepository;

@end
