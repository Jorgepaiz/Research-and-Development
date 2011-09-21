//
//  ObjDetectionAppDelegate_iPhone.m
//  ObjDetection
//
//  Created by Eng. Jorge Paiz on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ObjDetectionAppDelegate_iPhone.h"
#import "iPhoneViewController.h"


@implementation ObjDetectionAppDelegate_iPhone

@synthesize viewController = _viewController;

-(void)dealloc
{
    [self.viewController release];
    [self.window release];
    
    [super dealloc];
}

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.viewController = [[iPhoneViewController alloc] init];
    [self.window setRootViewController:self.viewController];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
