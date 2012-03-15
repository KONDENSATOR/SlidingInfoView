//
//  AppDelegate.m
//  InfoTest
//
//  Created by Martin Lübcke on 2012-03-15.
//  Copyright (c) 2012 Kondensator. All rights reserved.
//

#import "AppDelegate.h"
#import "SlidingInfoView.h"

@implementation AppDelegate

@synthesize window=_window;
@synthesize slidingInfoView=_slidingInfoView;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.slidingInfoView = [[SlidingInfoView alloc] init];
    [self.slidingInfoView setHostView:self.window.rootViewController.view onSubView:0];
    
    return YES;
}

@end
