//
//  CameraAVFoundationAppDelegate.m
//  CameraAVFoundation
//
//  Created by Jorge Paiz on 8/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CameraAVFoundationAppDelegate.h"

@implementation CameraAVFoundationAppDelegate


@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"application:didFinishLaunchingWithOptions on CameraAVFoundationAppDelegate");
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"applicationWillResignActive on CameraAVFoundationAppDelegate");
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"applicationDidEnterBackground on CameraAVFoundationAppDelegate");
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"applicationWillEnterForeground on CameraAVFoundationAppDelegate");
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"applicationDidBecomeActive on CameraAVFoundationAppDelegate");
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"applicationWillTerminate on CameraAVFoundationAppDelegate");
}

- (void)dealloc
{
    NSLog(@"dealloc on CameraAVFoundationAppDelegate");
    [_window release];
    [super dealloc];
}

@end
