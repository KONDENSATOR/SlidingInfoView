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

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[SlidingInfoView sharedSlidingInfoView] setHostView:self.window.rootViewController.view onSubView:0];
    return YES;
}

@end
